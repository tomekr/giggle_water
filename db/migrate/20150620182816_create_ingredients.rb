class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :amount
      t.string :use

      t.timestamps null: false
    end
  end
end
