class AddIngredientUseToDrinkItem < ActiveRecord::Migration
  def change
    add_column :drink_items, :ingredient_use, :string
  end
end
