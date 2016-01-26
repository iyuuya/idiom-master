class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :remember_digest

      t.timestamps
    end

    add_index :admins, :email, unique: true
  end
end
