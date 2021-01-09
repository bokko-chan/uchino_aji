Rails.application.routes.draw do
  devise_for :users
  root to: 'seasonings#index'
  get 'rakuten_search' => 'seasonings#index'

  # resources :users, :seasonings, only:[:index, :new, :create, :show] do
  #   resources :user_seasonings
  # end

  # resources :users, only:[:show]
  # resources :seasonings, only:[:index, :new, :create] do
  #   member do
  #     get :users
  #   end
  # end

  # resources :users do
  #   resources :seasonings
  # end

  # resources :users do
  #   resources :seasonings do
  #     resources :user_seasonings
  #   end
  # end

  resources :seasonings, only:[:index, :new, :create]
  resources :users, only:[:show]
  
end
