require "digest"

class RegistrationsController < ApplicationController
  def new
    # This is the registration page
  end

  def create
    email = params[:email]
    full_name = params[:full_name]
    username = params[:username]
    password1 = params[:password1]
    password2 = params[:password2]

    if password1 != password2
      flash.now[:alert] = "Passwords do not match"
      render :new, status: :unprocessable_entity
      return
    end

    if User.exists?(username: username)
      flash.now[:alert] = "Username already exists"
      render :new, status: :unprocessable_entity
      return
    end
    if User.exists?(email: email)
      flash.now[:alert] = "Email already exists"
      render :new, status: :unprocessable_entity
      return
    end

    if username.present? && password1.present?
      password_digest = password1
      User.create(
        username: username,
        email: email,
        full_name: full_name,
        password: password_digest
      )
      flash[:notice] = "Registration successful!"
      redirect_to root_path
      user = User.find_by(username: username)
      session[:username] = username
      session[:user_id] = user.id
      session[:email] = email
    else
      flash.now[:alert] = "Username or password is invalid"
      render :new, status: :unprocessable_entity
    end
  end
end
