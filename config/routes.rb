Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cars, only: [:new, :create, :show, :index] do
    resources :bookings, only: [:new, :create]
  end

  get 'users/:id/profile', to: 'users#profile'


  resources :bookings, only: :show
end
