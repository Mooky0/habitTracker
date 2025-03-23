class ProfilesController < ApplicationController
  def show
    @username = session[:username]
    @habits = ["Exercise", "Read", "Code"] # This should be replaced with a database query
  end
end
