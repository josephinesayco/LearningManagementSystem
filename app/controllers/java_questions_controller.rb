class JavaQuestionsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @questions = Questionnaire.all.order("RAND()").includes(:questionnaire_items)
  end

  def create
    @scores = check_answer
    @total_score = @scores.values.map(&:to_i).inject(:+) || 0

    p "Sum of scores"
    p @scores
    p @total_score

    render "result"
    #redirect_to java_questions_path
  end


  def result


  end


  private

  def check_answer
      answers = params[:java_questions]
      tags = Questionnaire.distinct(:tag).pluck(:tag) #integer, literal, etc
      scorer = Hash.new(0)

      answers.each do |q_number, ans_number|
        question = Questionnaire.where(id: q_number).first

        if(question)
          if question.answer == ans_number.to_s.to_i
            scorer[question.tag] += 1
          end
        end
      end

      scorer

  end
end
