class User < ApplicationRecord
    has_secure_password
    has_many :habits, dependent: :destroy
    attr_accessor :tracked_habits, :completed_habits, :missed_days, :ratio

    validates :username, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true

    def load_virtual_attributes
        @tracked_habits = Habit.where(user_id: id).count
        @completed_habits = habits.where(completed: true).count
        @missed_days = habits.sum(&:missed_days)
        @ratio = @completed_habits.to_f / @tracked_habits
    end
end
