require 'ostruct'

class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: session[:username])
    if @user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end
  end

  def update
    # TODO Implement user profile update
    user = User.find_by(username: session[:username])
    if user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end
    email = params[:user][:email]
    full_name = params[:user][:full_name]
    
    user.update(email: email, full_name: full_name)
    @user = User.find_by(username: session[:username])
    if user.save
      flash[:notice] = "Profile updated successfully!"
      redirect_to profile_path
    else
      flash.now[:alert] = "Failed to update profile"
      render :show, status: :unprocessable_entity
    end
  end
  
  private

  # def user_params
  #   params.require(:user).permit(:name, :username)
  # end
end