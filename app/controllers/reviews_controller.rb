class ReviewsController < ApplicationController
  def new
        @restaurant = Restaurant.find(params[:restaurant_id])

    @review = Review.new
  end

  def create
    @review = Review.create(params_review)
    @review.restaurant = Restaurant.find(params[:restaurant_id])

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def params_review
    params.require(:review).permit(:content, :rating, :restaurant)
  end
end
