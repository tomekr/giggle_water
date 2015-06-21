class AddDrinkItemsCountToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :drink_items_count, :integer, default: 0
  end
end
