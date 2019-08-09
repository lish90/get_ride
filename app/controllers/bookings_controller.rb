class BookingsController < ApplicationController
  before_action :set_car, only: [:show, :new, :create, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to new_car_booking_path(@car, @booking), notice: 'Booking was successfully Created '
    else
      render :new
    end

  end

  # def confirm
  #   @booking = Booking.new(booking_params)
  #   @booking.user = current_user
  #   @booking.car = @car
  #     if @booking.save
  #       redirect_to new_car_booking_path(@@car, @booking), notice: 'Please confirm you booking details '
  #     else
  #      render :new
  #     end
  # end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to car_booking_path(@car, @booking), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    if @booking.destroy
      redirect_to profile_path(current_user), notice: 'Booking was successfully deleted.'
    else
      render :destroy
    end
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :car_id)
  end
end
