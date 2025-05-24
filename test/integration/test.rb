require "test_helper"

class UserFullFlowTest < ActionDispatch::IntegrationTest
  test "user registration, login, habit creation, and dashboard display" do
    # Registration
    get registration_path
    assert_response :success

    post registration_path, params: {
      username: "integrationuser",
      full_name: "Integration User",
      email: "integration@example.com",
      password1: "password",
      password2: "password"
    }
    follow_redirect!
    assert_response :success
    assert_match "Registration successful!", response.body

    # Logout (if your app has logout)
    delete logout_path if defined?(logout_path)

    # Login
    get login_path
    assert_response :success

    post sessions_path, params: { username: "integrationuser", password: "password" }
    follow_redirect!
    assert_response :success
    assert_match "Logged in successfully!", response.body

    # Create a habit
    get new_habit_path
    assert_response :success

    post habits_path, params: {
      habit_name: "Integration Habit",
      is_daily: "true",
      color: "#123456"
    }
    follow_redirect!
    assert_response :success
    assert_match "Habit created! Integration Habit", response.body

    # Check habit appears on dashboard
    get root_path
    assert_response :success
    assert_match "Integration Habit", response.body
  end
end
