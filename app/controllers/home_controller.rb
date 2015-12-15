class HomeController < ApplicationController

  before_filter :authenticate_user!
  before_filter :check_if_done

  def index

    #status = current_user.is_passed.nil? ? current_user.status_passed? : current_user.is_passed
    # data

    if current_user.is_passed.nil?
      status = current_user.status_passed?
      current_user.update_attribute(:is_passed, status)
    else
      status = current_user.is_passed
    end

    @passed = status
  end

  private
  def check_if_done
    student = current_user.student
    unless student.act_ref.nil?
      if student.tag_1.nil?
        flash[:info] = "You may now start in java programming exam..."
        redirect_to java_questions_path
        return false
      end
    end
  end
end
