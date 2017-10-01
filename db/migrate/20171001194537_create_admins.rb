class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :login, index: true
      t.string :password_digest

      t.timestamps
    end
  end
end
