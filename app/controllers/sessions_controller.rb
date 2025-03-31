class SessionsController < ApplicationController
  def new
    # This is the login page
  end

  def create
    username = params[:username]
    password = params[:password]

    if username == "admin" && password == "admin"
      session[:username] = username
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:alert] = "Username or password is invalid"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    print "destroy"
    session[:username] = nil
    session.delete(:username)
    redirect_to root_path, notice: "Logged out!"
  end
end
