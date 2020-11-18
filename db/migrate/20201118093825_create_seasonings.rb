class CreateSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :seasonings do |t|
      t.references :user, null:false, foreign_key: true
      t.integer :salt_sugar_id
      t.integer :soy_sauce_id
      t.integer :liquor_id
      t.integer :miso_id
      t.integer :dashi_id
      t.integer :oil_id
      t.integer :vinegar_id
      t.integer :sauce_id
      t.integer :western_id
      t.integer :chinese_id
      t.integer :spice_herb_id
      t.integer :roux_id
      t.integer :dressing_id
      t.integer :other_id
      
      t.timestamps
    end
  end
end
