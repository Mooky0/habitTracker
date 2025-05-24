require "test_helper"

class RegistrationsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user with valid params" do
  assert_difference("User.count") do
    post :create, params: {
      username: "newuser",
      full_name: "New User",
      email: "newuser@example.com",
      password1: "password",
      password2: "password"
    }
  end
  assert User.find_by(username: "newuser"), "User was not found in the database during the test"
end

  test "should not create user with missing params" do
    assert_no_difference("User.count") do
      post :create, params: {
        username: "",
        full_name: "",
        email: "",
        password: "",
        created_on: ""
      }
    end
    assert_response :unprocessable_entity
    assert_match "Username or password is invalid", flash[:alert]
  end
end
