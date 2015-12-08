class TeachersController < ApplicationController
  layout 'teacher'
  before_action :authenticate_user!
  def prediction_result
  end

  def assessment_result
  end
end
