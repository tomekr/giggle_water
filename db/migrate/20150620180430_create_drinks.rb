class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :glass
      t.text :directions
      t.string :source

      t.timestamps null: false
    end
  end
end
