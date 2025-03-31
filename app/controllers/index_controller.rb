class IndexController < ApplicationController
    def index
        if !session[:username].present?
            redirect_to login_path
        end
        @message = "Hello World!"

    end
end
