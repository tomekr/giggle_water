class Search < ActiveRecord::Base
  def self.drink_name_search(search)
    Drink.where("name LIKE ?", "%#{search}%")
  end
  
  def self.ingredient_search(search)
    Ingredient.where("name LIKE ?", "%#{search}")
  end

  def self.drink_search(search)
    drink_results = drink_name_search(search)
    ingredient_search(search).each do |ingredient|
      ingredient.drinks.each do |drink|
        drink_results << drink
      end
    end
    drink_results
  end
end
