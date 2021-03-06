class RestaurantsController < ApplicationController
  # before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    set_restaurant
  end

  def update
    set_restaurant
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def destroy
    set_restaurant
    @restaurant.destroy
    redirect_to task_path
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
