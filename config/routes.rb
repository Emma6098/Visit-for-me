Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :visit_forms do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: :destroy do
    patch "accept", to: "pages#accept"
    patch "reject", to: "pages#reject"
  end
  resources :users, only: :show do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:destroy]

  # Defines the root path route ("/")
  # root "articles#index"
  resources :chatrooms, only: [:index, :show] do
    resources :chats, only: :create
  end
  get "control", to: "pages#control"
  get "guide", to:"pages#guide"
end
