require "test_helper"

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:username] = @user.username
  end

  test "should get show if user exists" do
    get :show
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should redirect to root if user not found" do
    session[:username] = "nonexistent"
    get :show
    assert_redirected_to root_path
    assert_equal "User not found", flash[:alert]
  end

  test "should update profile with valid params" do
    patch :update, params: { user: { email: "new@example.com", full_name: "New Name" } }
    assert_redirected_to profile_path
    assert_equal "Profile updated successfully!", flash[:notice]
    @user.reload
    assert_equal "new@example.com", @user.email
    assert_equal "New Name", @user.full_name
  end

  test "should redirect to root on update if user not found" do
    session[:username] = "nonexistent"
    patch :update, params: { user: { email: "fail@example.com", full_name: "Fail" } }
    assert_redirected_to root_path
    assert_equal "User not found", flash[:alert]
  end
end
