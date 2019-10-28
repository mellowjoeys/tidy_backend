class Api::SuggestionsController < ApplicationController
  before_action :authenticate_user

  def index
    @suggestions = current_user.suggestions
    render 'index.json.jb'
  end

  def create
    @suggestion = Suggestion.new(
                                  name: params[:name],
                                  value: params[:value]
                                )
    if @suggestion.save
      render 'show.json.jb'
    else
      render json: {errors: @suggestion.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def show
    @suggestion = Suggestion.find_by(params[:id])
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
    
  end
end
