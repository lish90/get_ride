class UsersController < ApplicationController

  def profile
    @bookings = current_user.bookings
    @listings = current_user.cars
  end

end
