class CreateThreePhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :three_phrases do |t|
      t.integer :char1_id, null: false
      t.integer :char2_id, null: false
      t.integer :char3_id, null: false
    end

    add_index :three_phrases, %i(char1_id char2_id char3_id), unique: true
    add_index :three_phrases, :char1_id
    add_index :three_phrases, :char2_id
    add_index :three_phrases, :char3_id
  end
end
