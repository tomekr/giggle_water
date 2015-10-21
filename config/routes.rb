Rails.application.routes.draw do
  # Route based declaration of requiring authentication. This is Devise's
  # recommended way of requiring auth
  authenticate :user do
    resources :bar_items
    resources :bars
    post '/bars/:id/make_current', to: 'bars#make_current'
    post '/ingredients/:id/add_to_bar', to: 'ingredients#add_to_bar'
    get '/drinks/makeable_drinks', to: 'drinks#makeable_drinks', as: 'makeable_drinks'
    get '/drinks/favorites', to: 'drinks#favorites', as: 'favorite_drinks'

    resources :ingredients do
      member do
        post :add_to_bar
        delete :remove_from_bar
      end
    end

    resources :drink_items

    resources :drinks do
      member do
        post :favorite
        delete :unfavorite
      end
    end
  end

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
