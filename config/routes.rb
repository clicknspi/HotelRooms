Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # root get "/", to: "home#index"
  # rooms get "rooms", to: "rooms#index"
  # room get "rooms/:id", to: "rooms#show"
  # new_booking post "rooms/:id/book", to: "bookings#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    resources :rooms, only: [:index, :show] do
    resources :bookings, only: [:create]

    post 'book', to: 'bookings#create', on: :member
    
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
