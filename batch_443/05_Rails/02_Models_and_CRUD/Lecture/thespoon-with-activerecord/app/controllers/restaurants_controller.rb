class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  
  def index
    @restaurants = Restaurant.all
  end

  def show
    # Get the restaurant instance with the id (1) in the URL
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    end
  end

  def edit
  end

  def update
    if @restaurant.update(strong_params)
      redirect_to restaurant_path(@restaurant)
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def strong_params
    params.require(:restaurant).permit(:name, :address)
  end
end
