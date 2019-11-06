class UserChore < ApplicationRecord
  belongs_to :user
  belongs_to :chore

  validates :chore_id, uniqueness: {scope: :start_of_week, message: "can only be taken by one person per week!"}
  
  

end
