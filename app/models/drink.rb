class Drink < ActiveRecord::Base
  has_many :drink_items, dependent: :destroy
  has_many :ingredients, through: :drink_items

  has_many :favorite_drinks

  validates :name, presence: true, uniqueness: true
  validates :directions, presence: true

  def minimal_ingredients
    drink_items.where(ingredient_use: "Build").includes(:ingredient).map do |drink_item|
      {ingredient_amount: drink_item.amount, ingredient_name: drink_item.ingredient.name}
    end
  end
end
