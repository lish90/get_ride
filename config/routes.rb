Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

   get 'users/:id/profile', to: 'users#profile', as: :profile
   get 'cars/car_id/bookings', to: 'bookings#confirm'
   post 'cars/car_id/bookings', to: 'bookings#confirm', as: :confirm
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cars do
    resources :bookings, only: [:new, :create, :edit, :update, :show]
  end


  resources :bookings, only: [:destroy]
end
