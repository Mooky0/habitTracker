require "application_system_test_case"

class UserFlowTest < ApplicationSystemTestCase
  test "user can register, login, create habit, and see it on dashboard" do
    # Registration

    visit registration_path
    fill_in "Username", with: "systemuser"
    fill_in "Name", with: "System User"
    fill_in "Email Address", with: "systemuser@example.com"
    fill_in "Password", with: "password", match: :first
    fill_in "Password Again", with: "password"
    page.save_screenshot("tmp/screenshots/registration.png")
    click_on "Register"

    assert_text "Registration successful!"

    # Create a habit
    visit new_habit_path
    page.save_screenshot("tmp/screenshots/new_habit.png")
    fill_in "New habit name", with: "System Habit"
    uncheck "Sets if new habit should be done daily" # or use the correct label
    fill_in "Habit color", with: "#123456"
    page.save_screenshot("tmp/screenshots/habit_form.png")
    click_on "Create"

    assert_text "Habit created! System Habit"

    # Dashboard should show the new habit
    visit root_path
    assert_text "System Habit"
  end
end
