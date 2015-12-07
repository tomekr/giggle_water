class Search < ActiveRecord::Base
  def self.drink_search(search)
    Drink.where("name LIKE ?", "%#{search}%")
  end
  
  def self.ingredient_search(search)
    Ingredient.where("name LIKE ?", "%#{search}%")
  end
end
