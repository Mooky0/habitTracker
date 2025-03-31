require 'ostruct'

class ProfilesController < ApplicationController
  def show
    @user = MockUser.new(
      username: "mock_user",
      full_name: "Mock User",
      email: "mock@example.com",
      tracked_habits: 3,
      completed_habits: 2,
      missed_days: 1,
      ratio: 0.67,
      created_on: Date.new(2022, 1, 1)
    )
  end

  def update
    # TODO Implement user profile update
    @user = MockUser.new(
      username: "mock_user",
      full_name: "Mock User",
      email: "mock@example.com",
      tracked_habits: 3,
      completed_habits: 2,
      missed_days: 1,
      ratio: 0.67,
      created_on: Date.new(2022, 1, 1)
    ) 
    params[:user] = @user
    redirect_to profile_path, notice: "Profile updated successfully."
  end

  private

  # def user_params
  #   params.require(:user).permit(:name, :username)
  # end
end