class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :chore
  
  def values_same?(chore_id) 
    values = suggested_values(chore_id)
    previous_value = values[0]
    index = 1
    while index < values.length
      if previous_value != values[index]
        return false
      else
        previous_value = values[index]
        index += 1
      end
    end
    true
  end

  def suggested_values(chore_id)
    chore = Chore.find(chore_id)
    chore.suggestions.pluck(:value)
  end

  def suggestions_equal_house_size?(chore_id)
    chore = Chore.find(chore_id)
    total_suggestions = chore.suggestions.length
    house_size = chore.house.users.length
    total_suggestions == house_size
  end

  def change_chore_value?(chore_id)
    values_same?(chore_id) && suggestions_equal_house_size?(chore_id)
  end # to be called in suggestion actions
end
