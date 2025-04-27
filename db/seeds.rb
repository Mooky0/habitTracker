# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.find_or_create_by!(
  username: "testuser",
  full_name: "Test User",
  email: "testuser@example.com",
  # password: "password",
  created_on: Date.today
) do |user|
  user.password_digest = BCrypt::Password.create("password")
  user.save!
end
# Create a habit for the test user
user = User.find_by(username: "testuser")
Habit.find_or_create_by!(
  user_id: user.id,
  name: "Test Habit",
  is_daily: true,
  color: "#FF5733",
  created_on: Date.today
) do |habit|
  habit.save!
end

# Create activities for the test habit
habit = Habit.find_by(name: "Test Habit")
Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today,
  completed: true
) do |activity|
  activity.save!
end

Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today-1,
  completed: true
) do |activity|
  activity.save!
end

Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today-3,
  completed: true
) do |activity|
  activity.save!
end

Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today-4,
  completed: true
) do |activity|
  activity.save!
end

Habit.find_or_create_by!(
  user_id: user.id,
  name: "Another Habit",
  is_daily: false,
  color: "#33FF57",
  created_on: Date.today
) do |habit|
  habit.save!
end

# Create activities for the second user's habit
habit = Habit.find_by(name: "Another Habit")
Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today,
  completed: true
) do |activity|
  activity.save!
end

Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today-2,
  completed: true
) do |activity|
  activity.save!
end
Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today-3,
  completed: true
) do |activity|
  activity.save!
end
Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today-5,
  completed: true
) do |activity|
  activity.save!
end
Activity.find_or_create_by!(
  habit_id: habit.id,
  date: Date.today-6,
  completed: true
) do |activity|
  activity.save!
end
