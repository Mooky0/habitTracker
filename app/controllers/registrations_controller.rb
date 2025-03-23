class RegistrationsController < ApplicationController
  def new
    # This is the registration page
  end

  def create
    username = params[:username]
    password = params[:password]

    if username.present? && password.present?
      session[:username] = username
      redirect_to root_path, notice: "Registered!"
    else
      flash.now[:alert] = "Username or password is invalid"
      render :new, status: :unprocessable_entity
    end
  end
end
