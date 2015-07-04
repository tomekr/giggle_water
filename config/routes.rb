Rails.application.routes.draw do
  resources :ingredients
  resources :drink_items
  resources :bar_items
  resources :bars
  resources :drinks do
    put :favorite, on: :member
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
