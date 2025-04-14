require 'digest'

class SessionsController < ApplicationController
  def new
    # This is the login page
  end

  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    print user.username
    if user.nil?
      flash.now[:alert] = "Username doesn't exist"
      render :new, status: :unprocessable_entity
      return
    end

   password_digest = Digest::SHA256.base64digest (password)
   if user&.authenticate(password_digest)
      session[:username] = user.username
      session[:user_id] = user.id
      session[:email] = user.email
      flash[:notice] = "Logged in successfully!"
      redirect_to root_path
      return
    else
      flash.now[:alert] = "Invalid username or password"
      render :new, status: :unprocessable_entity
      return
    end 

     
    
  end

  def destroy
    print "destroy"
    session[:username] = nil
    session[:user_id] = nil
    session[:email] = nil
    session.delete(:username)
    session.delete(:user_id)
    session.delete(:email)
    redirect_to root_path, notice: "Logged out!"
  end
end
