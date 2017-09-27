class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :login
      t.attachment :avatar

      t.timestamps
    end
  end
end
