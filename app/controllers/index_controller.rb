class IndexController < ApplicationController
    def index
        if !session[:username].present?
            redirect_to login_path
            return # Stop further execution
        end

        @user = User.find_by(username: session[:username])
        if @user.nil?
            redirect_to root_path, alert: "User not found"
            return # Stop further execution
        end

        start_of_month = Date.today.beginning_of_month
        end_of_month = Date.today.end_of_month
        @habits = Habit.where(user_id: @user.id)
        @habits.each do |habit|
            habit.activities = Activity.where(
                habit_id: habit.id,
                date: start_of_month..end_of_month
                )
            habit.load_virtual_attributes()
        end
        @month_name = Date.today.strftime("%B")
        @days_in_month = Date.today.end_of_month.day
        @date = Date.today
    end
end
