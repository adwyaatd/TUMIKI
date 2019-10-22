require 'test_helper'

class GoalControllerTest < ActionDispatch::IntegrationTest
  test "should get set_goal" do
    get goal_set_goal_url
    assert_response :success
  end

end
