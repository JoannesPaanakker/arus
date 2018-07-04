Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'appartment', to: 'pages#appartment', as: :appartment
  get 'boat', to: 'pages#boat', as: :boat
  get 'bookings', to: 'pages#bookings', as: :bookings

end
