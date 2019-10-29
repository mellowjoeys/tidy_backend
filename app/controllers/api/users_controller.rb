class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jb'
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      house_id: params[:house_id] || 1 # 1 is the placeholder house, which is where all users that did not know their house_id go before they have created/joined a house. 
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @user = User.find(params[:id])
    @user.house_id = params[:house_id] || @user.house_id
    render 'show.json.jb'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "User successfully deleted."}
  end
end
