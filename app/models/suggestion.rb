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
    values = []
    suggestions = Suggestions.where(house_id: current_user.house_id, chore_id: chore_id)
    #check if this is correct syntax, adding search terms. 
    suggestions.each do |suggestion|
      values << suggestion.value
    end
    values
  end

  def suggestions_equal_house_size?(chore_id)
    total_suggestions = Suggestions.where(chore_id: chore_id).length
    house_size = current_user.house.users.length
    total_suggestions == house_size
  end

  def change_chore_value?(chore_id)
    values_same?(chore_id) && suggestions_equal_house_size?(chore_id)
  end # to be called in suggestion actions
end
