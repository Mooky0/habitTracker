require "ostruct"

class ProfilesController < ApplicationController
  def show
    @user = User.find_by(username: session[:username])
    begin
      @user.load_virtual_attributes
    rescue StandardError => e
      redirect_to root_path, alert: "User not found"
      return
    end
    print @user.tracked_habits
    if @user.nil?
      redirect_to root_path, alert: "User not found"
      nil
    end
  end

  def update
    user = User.find_by(username: session[:username])
    if user.nil?
      redirect_to root_path, alert: "User not found"
      return
    end
    email = params[:user][:email]
    full_name = params[:user][:full_name]

    user.update(email: email, full_name: full_name)
    user.save!
    @user = User.find_by(username: session[:username])
    begin
      @user.load_virtual_attributes
    rescue StandardError => e
      redirect_to root_path, alert: "User not found"
      return
    end
    print @user.tracked_habits
    if user.save
      flash[:notice] = "Profile updated successfully!"
      redirect_to profile_path
    else
      flash.now[:alert] = "Failed to update profile"
      render :show, status: :unprocessable_entity
    end
  end

  private
end
