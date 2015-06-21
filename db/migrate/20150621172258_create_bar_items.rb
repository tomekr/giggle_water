class CreateBarItems < ActiveRecord::Migration
  def change
    create_table :bar_items do |t|
      t.references :ingredient, index: true, foreign_key: true
      t.belongs_to :bar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
