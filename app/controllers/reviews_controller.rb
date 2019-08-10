class ReviewsController < ApplicationController
  before_action :set_car, only: [:show, :new, :create]
  before_action :set_review, only: [:show]

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.car = @car
    if @review.save
      redirect_to car_review_path(@car, @review), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :details, :rating, :review_date, :user_id, :car_id)
  end
end
