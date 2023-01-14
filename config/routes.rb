Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: "pages#search", as: :search
  get '/dashboard', to:"pages#dashboard"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :masks do
    resources :bookings, only: [:index, :new, :create]
  end
    resources :bookings, only: [ :show, :edit, :update, :destroy ]
end
