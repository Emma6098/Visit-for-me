Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :visit_forms do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: :destroy
  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: :show do
    resources :chats, only: :create
end
end
