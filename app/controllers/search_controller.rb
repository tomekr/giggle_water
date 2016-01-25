class SearchController < ApplicationController
  def search
    @drink_results = drink_search(params[:search])
    @ingredient_results = ingredient_search(params[:search])
  end

  def drink_name_search(search)
    Drink.where("name LIKE ?", "%#{search}%")
  end
  
  def ingredient_search(search)
    Ingredient.where("name LIKE ?", "%#{search}%")
  end

  def drink_search(search)
    drink_results = drink_name_search(search)
    ingredient_search(search).each do |ingredient|
      ingredient.drinks.each do |drink|
        drink_results << drink
      end
    end
    drink_results
  end
end
