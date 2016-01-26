class CreateFourPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :four_phrases do |t|
      t.integer :char1_id
      t.integer :char2_id
      t.integer :char3_id
      t.integer :char4_id
    end

    add_index :four_phrases, %i(char1_id char2_id char3_id char4_id), unique: true, name: 'index_for_phrases_on_char_ids'
    add_index :four_phrases, :char1_id
    add_index :four_phrases, :char2_id
    add_index :four_phrases, :char3_id
    add_index :four_phrases, :char4_id
  end
end
