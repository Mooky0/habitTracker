require "test_helper"

class HabitTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "should not save habit without user" do
    habit = Habit.new(name: "No User Habit", color: "#123456", is_daily: true, created_on: Date.today)
    assert_not habit.save, "Saved the habit without a user"
  end

  test "should not save habit without name" do
    habit = Habit.new(user: @user, color: "#123456", is_daily: true, created_on: Date.today)
    assert_not habit.save, "Saved the habit without a name"
  end

  test "should not save habit without color" do
    habit = Habit.new(user: @user, name: "No Color Habit", is_daily: true, created_on: Date.today)
    assert_not habit.save, "Saved the habit without a color"
  end

  test "should not save habit without is_daily" do
    habit = Habit.new(user: @user, name: "No is_daily Habit", color: "#123456", created_on: Date.today)
    assert_not habit.save, "Saved the habit without is_daily"
  end

  test "should save valid habit" do
    habit = Habit.new(user: @user, name: "Valid Habit", color: "#123456", is_daily: true, created_on: Date.today)
    assert habit.save, "Could not save a valid habit"
  end
end
