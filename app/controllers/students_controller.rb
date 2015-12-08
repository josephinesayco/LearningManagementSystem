class StudentsController < ApplicationController
  layout 'teacher'
  before_filter :check_teacher

  def index
    @students = current_user.students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(permitted_params.merge(teacher_id: current_user.id))

    if @student.save
      flash[:notice] = "Student has been successfully created."
      redirect_to students_path
    else
      flash.now[:error] = @student.errors.full_messages.first
      render :new
    end

  end

  def edit
  end

  def update
  end

  private

  def permitted_params
    params.require(:student).permit(:student_number, :fullname, :lock)
  end

  def check_teacher
    redirect_to root_url unless current_user.is_a?(Teacher)
  end
end
