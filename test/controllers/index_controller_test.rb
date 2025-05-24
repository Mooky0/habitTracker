require "test_helper"

class IndexControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:username] = @user.username
  end

  test "should redirect to login if not logged in" do
    session[:username] = nil
    get :index
    assert_redirected_to login_path
  end

  test "should redirect to root if user not found" do
    session[:username] = "nonexistent"
    get :index
    assert_redirected_to root_path
    assert_equal "User not found", flash[:alert]
  end

  test "should get index if user is logged in" do
    get :index
    assert_response :success
    assert_not_nil assigns(:habits)
    assert_not_nil assigns(:month_name)
    assert_not_nil assigns(:days_in_month)
    assert_not_nil assigns(:date)
  end
end
