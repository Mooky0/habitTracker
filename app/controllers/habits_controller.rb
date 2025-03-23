class HabitsController < ApplicationController
  def new
    @habit = ""
  end

  def create
    habit_name = params[:habit_name]
    habit_daily = params[:habit_daily]
    habit_color = params[:habit_color]
    
    if habit_name.present? && habit_color.present?
      flash[:notice] = "Habit created! #{habit_name} #{habit_daily} #{habit_color}"
      redirect_to root_path
    else
      flash.now[:alert] = "Habit name, daily, and color are required"
      render :new, status: :unprocessable_entity
    end
  end
end
