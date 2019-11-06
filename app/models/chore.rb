class Chore < ApplicationRecord
  belongs_to :house
  has_many :suggestions
  has_many :user_chores
  has_many :users, through: :user_chores

  validates :name, presence: true
  validates :value, presence: true
  validates :house_id, presence: true 

  def delete_suggestions(chore_id)
    Suggestion.delete_by(chore_id: chore_id)
  end
end
