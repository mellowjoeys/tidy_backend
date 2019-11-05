class House < ApplicationRecord
  has_many :users
  has_many :chores
  has_many :user_chores, through: :users

  validates :name, presence: true

  def unchosen_chores
    chosen_chore_ids = user_chores.where(start_of_week: last_sunday).pluck(:chore_id)
    all_chores_ids = chores.pluck(:id)
    unchosen_ids = all_chores_ids - choseen_chore_ids
    Chore.where(id: unchosen_ids)
  end
end
