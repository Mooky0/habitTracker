class Habit < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy
  
  validates :name, presence: true
  validates :color, presence: true
  validates :is_daily, inclusion: { in: [true, false] }
end
