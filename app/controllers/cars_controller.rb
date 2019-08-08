class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car), notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car), notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @car.bookings.empty?
      @car.destroy
      redirect_to profile_path(current_user), notice: 'Car was successfully deleted.'
    else
      redirect_to profile_path(current_user), notice: 'Car cannot be deleted, it has associated bookings.'
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :category, :description, :rate, :user_id)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end
