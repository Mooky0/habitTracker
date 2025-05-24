require "test_helper"

class SessionsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @user.update(password: "password") # Ensure password is set for authentication
  end

  test "should get new (login page)" do
    get :new
    assert_response :success
  end

  test "should login with valid credentials" do
    post :create, params: { username: @user.username, password: "password" }
    assert_redirected_to root_path
    assert_equal "Logged in successfully!", flash[:notice]
    assert_equal @user.username, session[:username]
    assert_equal @user.id, session[:user_id]
    assert_equal @user.email, session[:email]
  end

  test "should not login with invalid username" do
    post :create, params: { username: "wronguser", password: "password" }
    assert_response :unprocessable_entity
    assert_equal "Username doesn't exist", flash.now[:alert]
  end

  test "should not login with invalid password" do
    post :create, params: { username: @user.username, password: "wrongpassword" }
    assert_response :unprocessable_entity
    assert_equal "Invalid username or password", flash.now[:alert]
  end

  test "should logout" do
    session[:username] = @user.username
    session[:user_id] = @user.id
    session[:email] = @user.email
    delete :destroy
    assert_redirected_to root_path
    assert_equal "Logged out!", flash[:notice]
    assert_nil session[:username]
    assert_nil session[:user_id]
    assert_nil session[:email]
  end
end
