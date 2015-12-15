class TeachersController < ApplicationController
  layout 'teacher'
  before_action :authenticate_user!
  before_action :authenticate_teacher

  def home

  end

  def prediction_result
    @q = User.student.search(params[:q])
    @students = @q.result(distinct: true)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "prediction", layout: "pdf"   # Excluding ".pdf" extension.
      end
    end
    #User.student.select(:student_number, :fullname, :gender, :age, :course, :yr_level, :section, :schedule, :prog_1, :prog_2, :prog_3, :username, :is_passed, :passed_java).where(id: (41..51))
  end

  def java_assessment_result
    @q = User.student.search(params[:q])
    @students = @q.result(distinct: true)
  end

  def ils_evaluation_result
    @q = Student.search(params[:q])
    @students = @q.result(distinct: true).joins(:user)
    # binding.pry
  end

  def destroy_all
    students = current_user.students
    if students.destroy_all
      flash[:success] = "Successfully remove all student records."
    end
  end

  private
  def authenticate_teacher
    redirect_to root_url unless current_user.is_a?(Teacher)
  end
end
