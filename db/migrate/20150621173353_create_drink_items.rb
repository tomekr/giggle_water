class CreateDrinkItems < ActiveRecord::Migration
  def change
    create_table :drink_items do |t|
      t.references :ingredient, index: true, foreign_key: true
      t.belongs_to :drink, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
