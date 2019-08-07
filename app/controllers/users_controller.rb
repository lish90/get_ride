class UsersController < ApplicationController
  # before_action :set_user, only: [:edit, :update]

  def profile
    @bookings = current_user.bookings
    @listings = current_user.cars
  end

  # def edit
  # end

  # def update
  #   if @user.update(user_params)
  #     redirect_to profile_path(current_user), notice: 'User was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # private

  # def set_user
  #   @user = current_user
  # end

  # def user_params
  #   params.require(:user).permit()
  # end
end
