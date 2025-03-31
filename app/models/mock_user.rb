class MockUser
  include ActiveModel::Model
  attr_accessor :username, :full_name, :email, :tracked_habits, :completed_habits, :missed_days, :ratio, :created_on

  def to_param
    "mock_user"
  end
end
