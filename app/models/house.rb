class House < ApplicationRecord
  has_many :users
  has_many :chores
end
