class CreateSeasoningSaltSugars < ActiveRecord::Migration[6.0]
  def change
    create_table :seasoning_salt_sugars do |t|
      t.references :seasoning, foreign_key: true
      t.references :salt_sugar
      t.timestamps
    end

  end
end
