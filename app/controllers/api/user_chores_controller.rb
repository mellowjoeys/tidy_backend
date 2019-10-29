class Api::UserChoresController < ApplicationController
  def index
    @user_chores = UserChore.where(start_of_week: params[:start_of_week])
    render 'index.json.jb'
  end

  def create
    @user_chore = UserChore.new(
                                chore_id: params[:chore_id],
                                user_id: current_user.id,
                                start_of_week: params[:start_of_week],
                                completed: false
                               )
    render 'show.json.jb'
  end

  def show
    @user_chore = UserChore.find(params[:id])
    render 'show.json.jb'
  end

  def update
    # @user_chore = UserChore.find(params[:id])
    # @user_chore.value = params[:value] || @user_chore.value
    # if @user_chore.save
    #   render 'show.json.jb'
    # else
    #   render json: {errors: @user_chore.errors.full_messages, status: :unprocessable_entity}
  end
  def destroy
  end
end
