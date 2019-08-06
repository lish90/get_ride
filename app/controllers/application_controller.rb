class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #allow access to only home page without login can add other pages to array.
  before_action :authenticate_user!
end
