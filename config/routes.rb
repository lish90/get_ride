Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

   get 'users/:id/profile', to: 'users#profile', as: :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cars do
    resources :bookings, only: [:new, :create, :edit, :update, :show]
    resources :reviews, only: [:new, :create, :show]
  end


  resources :bookings, only: [:destroy]
end
