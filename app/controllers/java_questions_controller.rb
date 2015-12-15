class JavaQuestionsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :set_student
  #before_filter :check_tags, only: [:index, :create]

  def index

    @questions = Questionnaire.limit(5).order("RAND()").includes(:questionnaire_items)
    time = @student.java_timer
    has_started = time.try(:start_at).nil?

    start_dt = Time.now.utc
    # binding.pry
    timer = (cookies[:timer] || start_dt).to_s.to_datetime + 20.seconds#1.hour

    hash_diff = time_diff_hash(timer, start_dt)

    @timer_until = if timer > start_dt
      start_dt + hash_diff[:minutes].minutes + hash_diff[:seconds].seconds
    else
      start_dt
    end



    if has_started
      time_class = time || JavaTimer.new(student_id: @student.id)
      # time_class.update_attribute(:start_at, start_dt)
      cookies[:timer] =  { :value => start_dt, :expires => start_dt + 1.minutes}
    end
  end

  def create
    @scores = check_answer
    @total_score = @scores.values.map(&:to_i).inject(:+) || 0

    add_attr = Hash.new(0)

    Questionnaire::TAGS.keys.each do |key|
      key_attr = "tag_#{key}"
      add_attr[key_attr] = @scores[key-1].to_i
    end

    @student.update_attributes(add_attr)

    flash[:success] = "Examination in java has been done."
    redirect_to result_java_questions_path
    #redirect_to
  end


  def result
    keys =  Questionnaire::TAGS.keys.map{|e| "tag_#{e}"}.join(" + ")
    #binding.pry
    @total_score = Student.select("(#{keys}) as total_score").where(student_number: @student.student_number).first.try(:total_score)

  end

  def lock
    redirect_to root_path unless request.xhr?

    @student.update_attribute(:lock, true)
    if @student.java_timer
      @student.java_timer.update_attribute(:lock, true)
    end

    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript' }
      format.html
    end
  end

  def validate_teacher_password
    password = params[:teacher][:password]
    @valid_password = current_user.teacher.valid_password?(password)
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

  def time_diff_hash(t1, t2)
    seconds = (t1.to_i - t2.to_i)
    days = seconds / 86400;
    hours = seconds / 3600;
    minutes = (seconds - (hours * 3600)) / 60;
    seconds = (seconds - (hours * 3600) - (minutes * 60));
    {hours: hours, minutes: minutes, seconds: seconds}
  end

  def set_student
    @student = current_user.student
  end

  def check_tags
    unless @student.tag_1.nil?

      redirect_to result_java_questions_path
      flash[:info] = "You've already taken the exam."
      return
    end
  end
end
