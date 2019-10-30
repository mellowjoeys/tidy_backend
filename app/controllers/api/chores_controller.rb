class Api::ChoresController < ApplicationController #need before_action
  before_action :authenticate_user

  def index
    whole_house = params[:house]  
    if whole_house == "true"
      @chores = current_user.house.chores
    else
      @chores = current_user.chores_for_this_week
    end
    render 'index.json.jb'
  end

  def create
    @chore = Chore.new(
                        name: params[:name],
                        value: 0,
                        house_id: current_user.house_id
                      )
    if @chore.save
      render 'show.json.jb'
    else
      render json: {errors: @chore.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def show
    @chore = Chore.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @chore = Chore.find(params[:id])
    @chore.value = params[:value] || @chore.value
    if @chore.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    render json: {message: "chore destroyed"}
  end

end