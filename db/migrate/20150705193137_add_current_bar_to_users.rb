class AddCurrentBarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_bar_id, :integer
  end
end
