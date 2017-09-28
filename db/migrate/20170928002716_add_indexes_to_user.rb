class AddIndexesToUser < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :login
    add_index :users, :email
  end
end
