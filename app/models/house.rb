class House < ApplicationRecord
  has_many :users
  has_many :chores
  has_many :user_chores, through: :users

  validates :name, presence: true

  def approved_chores
    chores.where("value > ?", 0)
  end

  def unapproved_chores
    chores.where(value: 0)
  end

  def unchosen_chores
    chosen_chore_ids = user_chores.where(start_of_week: next_sunday).pluck(:chore_id)
    all_chores_ids = chores.pluck(:id)
    unchosen_ids = all_chores_ids - chosen_chore_ids
    Chore.where(id: unchosen_ids) - unapproved_chores
  end

  def chosen_chores
    user_chores.where(start_of_week: next_sunday)
  end

end
