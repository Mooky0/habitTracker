class Activity < ApplicationRecord
  belongs_to :habit

  validates :date, presence: true
  validates :completed, inclusion: { in: [true, false] }
  validates :habit_id, uniqueness: { scope: :date }
end
