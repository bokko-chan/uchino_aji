Rails.application.routes.draw do
  devise_for :users
  root to: 'seasonings#index'
  get 'rakuten_search' => 'seasonings#index'
  resources :seasonings, only:[:index]
  resources :users, only:[:show]
end
