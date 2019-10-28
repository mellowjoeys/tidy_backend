class Chore < ApplicationRecord
  belongs_to :house
  has_many :suggestions
  has_many :user_chores
  has_many :users, through: :user_chores
end
