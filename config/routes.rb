Rails.application.routes.draw do

  get 'sign_in' => 'user_sessions#new', as: :new_user_session
  post 'sign_in' => 'user_sessions#create', as: :user_session
  get 'sign_out' => 'user_sessions#destroy', as: :destroy_user_session
  post 'sign_out' => 'user_sessions#destroy', as: nil

  resource :user, only: [:new, :create]
  resources :pledges
  resources :charities
  
  # Pages
  get "/pages/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'index'
end
