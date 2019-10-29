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
    if @suggestion.save
      render 'show.json.jb'
    else
      render json: {errors: @suggestion.errors.full_messages, status: :unprocessable_entity}
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
      render 'show.json.jb'
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
