require 'test_helper'

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_goal_url
    assert_response :success
  end

end
