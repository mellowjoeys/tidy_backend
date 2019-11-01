 class Api::UsersController < ApplicationController

  def index
    @users = User.where(house_id: current_user.house_id)
    render 'index.json.jb'
  end

  def create
    if params[:house_id] && params[:house_id] != ""
      house = House.find(params[:house_id])
    else
      house = House.create(name: params[:house_name]) #create
    end

    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      house_id: house.id # 1 is the placeholder house, which is where all users that did not know their house_id go before they have created/joined a house. 
    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      house.destroy
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    if params[:id] == "current"
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    render 'show.json.jb'
  end

  def update
    @user = current_user
    if House.find(params[:house_id])
      if params[:house_id]
        @user.house_id = params[:house_id]
        @user.save
        render 'show.json.jb'
      else
        render json: {message: "Please add a house_id to change and number to change it to."}
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "User successfully deleted."}
  end
end
