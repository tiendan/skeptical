class CreateHumanNames < ActiveRecord::Migration
  def change
    create_table :human_names do |t|
      t.string :name
      t.integer :origin_language_id
      t.boolean :is_natural
      t.text :description
      t.string :gender
      t.boolean :is_forbidden

      t.timestamps
    end
  end
end
