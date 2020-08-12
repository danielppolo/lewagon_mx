class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    # Get the restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    # Create a new instance of the Review
    @review = Review.new(strong_params)
    # Assign the restaurant to the review
    @review.restaurant = @restaurant
    # Save it
    if @review.save
      # Redirect
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    restaurant = @review.restaurant
    @review.destroy

    redirect_to restaurant_path(restaurant)
  end

  private

  def strong_params
    params.require(:review).permit(:content)
  end
end
