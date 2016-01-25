class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :char, null: false
    end

    add_index :characters, :char
  end
end
