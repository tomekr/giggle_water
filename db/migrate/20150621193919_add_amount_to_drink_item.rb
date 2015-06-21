class AddAmountToDrinkItem < ActiveRecord::Migration
  def change
    add_column :drink_items, :amount, :string
  end
end
