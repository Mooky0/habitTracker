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

  def track
    habit = Habit.find(params[:habit_id])
    date = Date.parse(params[:date]) # Parse the date from the parameters

    # Create or update the activity for the habit on the given date
    activity = Activity.find_or_initialize_by(habit: habit, date: date)
    if activity.completed == true
      activity.completed = false
    else
      activity.completed = true
    end
    activity.save!

    render json: { success: true, completed: activity.completed }
  rescue StandardError => e
    render json: { success: false, error: e.message }, status: :unprocessable_entity
  end
end
