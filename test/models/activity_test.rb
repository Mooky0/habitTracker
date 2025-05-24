require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  def setup
    @habit = habits(:one)
  end

  test "should not save activity without habit" do
    activity = Activity.new(date: Date.today, completed: true)
    assert_not activity.save, "Saved the activity without a habit"
  end

  test "should not save activity without date" do
    activity = Activity.new(habit: @habit, completed: true)
    assert_not activity.save, "Saved the activity without a date"
  end

  test "should not save duplicate activity for same habit and date" do
    Activity.create!(habit: @habit, date: Date.today, completed: true)
    duplicate = Activity.new(habit: @habit, date: Date.today, completed: false)
    assert_not duplicate.save, "Saved a duplicate activity for the same habit and date"
  end

  test "should save valid activity" do
    activity = Activity.new(habit: @habit, date: Date.today + 1, completed: false)
    assert activity.save, "Could not save a valid activity"
  end
end
