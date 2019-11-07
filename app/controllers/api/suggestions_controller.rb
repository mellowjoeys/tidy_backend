class Api::SuggestionsController < ApplicationController
  before_action :authenticate_user

  def index
    @suggestions = current_user.suggestions
    render 'index.json.jb'
  end

  def create
    @suggestion = Suggestion.new(
                                  chore_id: params[:chore_id],
                                  user_id: current_user.id,
                                  value: params[:value]
                                )
    if @suggestion.unique_suggestion?(params[:chore_id], current_user.id)
      if @suggestion.save
        if @suggestion.change_chore_value?(params[:chore_id])
          chore_to_be_changed = Chore.find(params[:chore_id])
          chore_to_be_changed.value = params[:value]
          chore_to_be_changed.delete_suggestions(params[:chore_id])
          render json: {message: "Chore has been approved and suggestions have been deleted"}
        else
          # add render line. delete suggestions for given chore if 
          render 'show.json.jb'
        end
      else
        render json: {errors: @suggestion.errors.full_messages, status: :unprocessable_entity}
      end
    else
      render json: {message: "You've already made a suggestion for this chore!"}
    end
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    @suggestion.value = params[:value] || @suggestion.value

    if @suggestion.save
      if @suggestion.change_chore_value?(params[:chore_id])
        chore_to_be_changed = Chore.find(params[:chore_id])
        chore_to_be_changed.value = params[:value]
        chore_to_be_changed.delete_suggestions(params[:chore_id])
        render json: {message: "Chore has been approved and suggestions have been deleted"} # WET code, repeats in suggestion create action. Write a class method to handle this later. 
      else
        render 'show.json.jb'
      end
    else
      render json: {errors: @suggestion.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy
    render json: {message: "Suggestion destroyed"}
  end
end
