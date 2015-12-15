class LearningSystemsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :set_student

	def index
		respond_to do |format|
			format.html
			# format.js { render :json => @switches }
		end

	end

	def create
		# //Insert computation here
		answers = create_params
		final_answers = {}

		# act/ref sent/int vis/vrb seq/glo
    # 40 items, by_4 each category
		Student::STUDENT_LMS.each do |start_num|
			keys_array = (start_num..Questions::QUESTIONNAIRES.count).step(4).to_a.map(&:to_s)

			answer_a = answers.select{|k, v| keys_array.include?(k) && v == "0"}.count
			answer_b = answers.select{|k, v| keys_array.include?(k) && v == "1"}.count

			tmp_ans = answer_a - answer_b
			letter = tmp_ans > 0 ? "a" : "b"
			final_answers[start_num] = "#{letter}"
		end

    if @student
      add_attr = {}
      Student::LMS_ATTR.each do |k, v|
        val = Student::ILS_VALUE[v][final_answers[k]]
        add_attr[v] = val
      end

      @student.update_attributes(add_attr)
    end
    p final_answers

    respond_to do |format|
      format.html { redirect_to java_questions_path}
      format.js do
       render :js => "window.location = '/java_questions';"
     end

    end


  end

  private
  def create_params
  	params.require(:questions).permit(Questions::QUESTIONNAIRES.keys.map(&:to_s))
  end

  def set_student
    @student = Student.where(student_number: current_user.student_number).first
  end
end
