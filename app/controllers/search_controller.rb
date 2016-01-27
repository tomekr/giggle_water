class SearchController < ApplicationController
  def search
    @drink_results = drink_name_search(params[:search])
    @drinks_with_ingredient = joined_drink_search(params[:search])
    @ingredient_results = ingredient_search(params[:search])
  end

  def drink_name_search(search)
    Drink.where("name LIKE ?", "%#{search}%")
  end
  
  def ingredient_search(search)
    Ingredient.where("name LIKE ?", "%#{search}%")
  end

  def joined_drink_search(search)
    Drink.joins(drink_items: :ingredient).where("ingredients.name like ?", "%#{search}%" )
  end
end
