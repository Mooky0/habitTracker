class User < ApplicationRecord
    has_secure_password
    has_many :habits, dependent: :destroy

    validates :username, presence: true, uniqueness: true
    validates :full_name, presence: true
    validates :email, presence: true, uniqueness: true
end
