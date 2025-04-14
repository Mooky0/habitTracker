class HabitsController < ApplicationController
  def new
    @habit = ""
  end

  def create
    habit_name = params[:habit_name]
    habit_daily = params[:is_daily]
    habit_color = params[:color]
    
    if habit_name.present? && habit_color.present?
      habit_daily = habit_daily == "true" ? true : false
      Habit.create(
        name: habit_name,
        is_daily: habit_daily,
        color: habit_color,
        user_id: session[:user_id]
      )
      
      flash[:notice] = "Habit created! #{habit_name}"
      redirect_to root_path
    else
      flash.now[:alert] = "Habit name, daily, and color are required"
      render :new, status: :unprocessable_entity
    end
  end
end
