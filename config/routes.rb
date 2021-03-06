Rails.application.routes.draw do
  resources :bookings
  devise_for :users, controllers: {
   registrations: "registrations",
  }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'appartment', to: 'pages#appartment', as: :appartment
  get 'boat', to: 'pages#boat', as: :boat
  get 'contact', to: 'pages#contact'

end
