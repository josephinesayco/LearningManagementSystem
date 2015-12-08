class LearningSystemsController < ApplicationController

  before_filter :authenticate_user!
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
		(1..4).each do |start_num|
			keys_array = (start_num..Questions::QUESTIONNAIRES.count).step(4).to_a.map(&:to_s)
			answer_a = answers.select{|k, v| keys_array.include?(k) && v == "0"}.count
			answer_b = answers.select{|k, v| keys_array.include?(k) && v == "1"}.count

			tmp_ans = answer_a - answer_b
			letter = tmp_ans > 0 ? "a" : "b"
			final_answers[start_num] = "#{tmp_ans}#{letter}"
		end

		p final_answers



		# Question
  	end

  	private
  	def create_params
  		params.require(:questions).permit(Questions::QUESTIONNAIRES.keys.map(&:to_s))
  	end
end
