require "test_helper"

class HabitsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @habit = habits(:one)
    session[:user_id] = @user.id
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create habit with valid params" do
    assert_difference("Habit.count") do
      post :create, params: {
        habit_name: "Test Controller Habit",
        is_daily: "true",
        color: "#123456"
      }
    end
    assert_redirected_to root_path
    assert_equal "Habit created! Test Controller Habit", flash[:notice]
  end

  test "should not create habit with missing params" do
    assert_no_difference("Habit.count") do
      post :create, params: {
        habit_name: "",
        is_daily: "",
        color: ""
      }
    end
    assert_response :unprocessable_entity
    assert_match "Habit name, daily, and color are required", @response.body
  end
end
