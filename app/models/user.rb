class User < ApplicationRecord
  belongs_to :house
  has_many :suggestions
  has_many :user_chores
  has_many :chores, through: :user_chores

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def chores_for_this_week # probably unneeded considering there is a remaining_chores method. 
    chores_this_week = chores.where( "user_chores.start_of_week = ?", last_sunday_for_sql)
    # map_chores(chores_this_week)
  end

  def chores_for_next_week
    chores.where("user_chores.start_of_week = ?", next_sunday_for_sql)
  end

  def unchosen_chores
    house.unchosen_chores
  end

  # def map_chores(chores)
  #   chores.map{ |chore| {id: chore.id, name: chore.name, value: chore.value }}
  # end

  def remaining_chores_this_week
    chores.where( "user_chores.completed = ? and user_chores.start_of_week = ?", false, last_sunday_for_sql)
  end

  def completed_chores_this_week
    completed_chores = chores.where( "user_chores.completed = ? and user_chores.start_of_week = ?", true, last_sunday_for_sql)
    # map_chores(completed_chores)  
  end

  def next_week_gross_value
    chores = chores_for_next_week
    value = 0
    chores.each do |chore|
      value += chore.value
    end
    value
  end

  def last_week_deficit
    incomplete_chores = chores.where(" user_chores.completed = ? and user_chores.start_of_week = ?", false, two_sundays_ago_for_sql)
    value = 0
    incomplete_chores.each do |chore|
      value += chore.value
    end
    value
  end

  def next_week_net_value
    next_week_gross_value - last_week_deficit
  end
end