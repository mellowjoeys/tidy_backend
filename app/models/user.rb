class User < ApplicationRecord
  belongs_to :house
  has_many :suggestions
  has_many :user_chores
  has_many :chores, through: :user_chores

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
