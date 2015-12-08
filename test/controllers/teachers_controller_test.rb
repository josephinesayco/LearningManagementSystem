require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  test "should get prediction_result" do
    get :prediction_result
    assert_response :success
  end

  test "should get assessment_result" do
    get :assessment_result
    assert_response :success
  end

end
