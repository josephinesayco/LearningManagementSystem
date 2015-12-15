class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :select_layout

  devise_group :user, contains: [:user, :admin, :teacher]
  # before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?

  private
  def select_layout
    # binding.pry
    if user_signed_in?# || teacher_signed_in?
        "main"
    else
        "app"
    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :type, :password, :remember_me) }

    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:fullname, :gender, :age, :course, :yr_level, :section, :prior_prog_lang,
       :self_assessment, :email, :password, :password_confirmation,
       :student_number, :schedule, :prog_1, :prog_2, :prog_3, :username, :passed_java)
    end
    # student_number, schedule, prog_1, prog_2, prog_3, username

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:real_name, :screen_name, :email, :password, :password_confirmation, :provider, :uid, :name, :time_zone)
    end
  end

end
