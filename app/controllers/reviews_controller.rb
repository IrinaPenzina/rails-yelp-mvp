class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
    set_review
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def edit
    set_review
  end

  def update
    set_review
    @review.update(review_params)
    redirect_to reviews_path
  end

  def destroy
    set_review
    @review.destroy
    redirect_to task_path
  end

  def set_review
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
