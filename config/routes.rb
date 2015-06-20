Rails.application.routes.draw do
  resources :drinks
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
