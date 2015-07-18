class CreateFavoriteDrinks < ActiveRecord::Migration
  def change
    create_table :favorite_drinks do |t|
      t.integer :drink_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
