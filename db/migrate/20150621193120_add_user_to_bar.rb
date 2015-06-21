class AddUserToBar < ActiveRecord::Migration
  def change
    add_reference :bars, :user, index: true, foreign_key: true
  end
end
