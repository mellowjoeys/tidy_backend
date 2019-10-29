class User < ApplicationRecord
  belongs_to :house
  has_many :suggestions
  has_many :user_chores
  has_many :chores, through: :user_chores

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def chores_for_this_week
    chores.where( "user_chores.start_of_week = ?", last_sunday)
  end

  def chores_for_next_week
    chores.where("user_chores.start_of_week = ?", next_sunday)
  end
end
