class Api::HousesController < ApplicationController
  before_action :authenticate_user, only: [:create]
  
  def index
    @houses = House.all
    render 'index.json.jb'
  end

  def create
    @house = House.new(name: params[:name])
    if @house.save
      render 'show.json.jb'
    else
      render json: {errors: @house.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def show
    @current_user = current_user
    if params[:id] == "current"
      @house = current_user.house
    else
      @house = House.find(params[:id])
    end
      render 'show.json.jb'
  end

  def update
  end

  def destroy
  end

end
