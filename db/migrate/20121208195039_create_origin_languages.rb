class CreateOriginLanguages < ActiveRecord::Migration
  def change
    create_table :origin_languages do |t|
      t.string :name

      t.timestamps
    end
  end
end
