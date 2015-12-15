class StudentsController < ApplicationController
  layout 'teacher'
  before_filter :check_teacher

  before_filter :set_student, only: [:edit, :update, :destroy]

  def index
    @students = current_user.students
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(permitted_params.merge(teacher_id: current_user.id))

    if @student.save
      flash[:success] = "Student has been successfully created."
      redirect_to students_path
    else
      flash.now[:error] = @student.errors.full_messages.first
      render :new
    end

  end

  def edit
    @student = current_user.students.where(id: params[:id]).first
  end

  def update

    if @student.update_attributes(permitted_params)
      flash[:success] = "Student has been successfully updated."
      redirect_to students_path
    else
      flash.now[:error] = @student.errors.full_messages.first
      render :edit
    end

  end

  def destroy
    @student.destroy
    flash[:danger] = "Student has been successfully deleted."

    redirect_to students_path
  end

  private

  def permitted_params
    params.require(:student).permit(:student_number, :fullname, :lock)
  end

  def check_teacher
    redirect_to root_url unless current_user.is_a?(Teacher)
  end

  def set_student
    @student = current_user.students.where(id: params[:id]).first

    unless @student
      redirect_to students_path
      flash[:danger] = "Student not found."
      return false
    end
  end
end
