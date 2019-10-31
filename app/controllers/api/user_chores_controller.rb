class Api::UserChoresController < ApplicationController
  before_action :authenticate_user

  def index
    if params[:start_of_week]

      @user_chores = UserChore.where(start_of_week: params[:start_of_week])
      render 'index.json.jb'
    else
      render json: {message: "need to include a start_of_week value with request"}
    end
  end

  def create
    @user_chore = UserChore.new(
      chore_id: params[:chore_id],
      user_id: current_user.id,
      start_of_week: params[:start_of_week],
      completed: false
    )
    
    if @user_chore.save
      render 'show.json.jb'
    else
      render json: {errors: @user_chore.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def show
    @user_chore = UserChore.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @user_chore = UserChore.find(params[:id])
    @user_chore.completed = true
    if @user_chore.save
      render 'show.json.jb'
    else
      render json: {errors: @user_chore.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def destroy
  end

end
