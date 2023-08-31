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

  # Defines the root path route ("/")
  # root "articles#index"
<<<<<<< HEAD
  resources :chatrooms, only: :show do
    resources :chats, only: :create
end
=======
  get "control", to: "pages#control"
  get "guide", to:"pages#guide"
>>>>>>> 82b651ddce831118e31b149b9d265c76f24ec197
end
