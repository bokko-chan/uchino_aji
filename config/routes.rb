Rails.application.routes.draw do
  devise_for :users
  root to: 'seasonings#index'
  resources :seasonings, only:[:index]
end
