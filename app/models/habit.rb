class Habit < ApplicationRecord
  belongs_to :user
  has_many :activities, dependent: :destroy

  validates :name, presence: true
  validates :color, presence: true
  validates :is_daily, presence: true
  validates :is_daily, inclusion: { in: [ true, false ] }

  attr_accessor :activities_days, :activities_completed

  def load_virtual_attributes
    @activities_days = activities.select { |activity| activity.completed }.map { |activity| activity.date.day }
    @activities_completed = activities.map { |activity| activity.completed }
  end
end
