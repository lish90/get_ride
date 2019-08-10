class PagesController < ApplicationController
  #allow access to only home page without login can add other pages to array.
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @cars = Car.all.shuffle.take(3)
  end
end
