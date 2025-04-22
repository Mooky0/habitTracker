class User < ApplicationRecord
    has_secure_password
    has_many :habits, dependent: :destroy
    attr_accessor :tracked_habits, :completed_habits, :missed_days, :ratio

    validates :username, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true

    def load_virtual_attributes
        @tracked_habits = Habit.where(user_id: id).count
        habits = Habit.where(user_id: id)
        @completed_habits = 0
        @missed_days = 0 # Initialize @missed_days to 0

        for habit in habits
          @completed_habits += Activity.where(habit_id: habit.id, completed: true).count
          @missed_days += Activity.where(habit_id: habit.id, completed: false).count
        end

        @ratio = @tracked_habits > 0 ? @completed_habits.to_f / @tracked_habits : 0
    end
end
