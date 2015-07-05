Rails.application.routes.draw do
  # Route based declaration of requiring authentication. This is Devise's
  # recommended way of requiring auth
  authenticate :user do
    resources :bar_items
    resources :bars
  end

  resources :ingredients
  resources :drink_items
  resources :drinks
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
