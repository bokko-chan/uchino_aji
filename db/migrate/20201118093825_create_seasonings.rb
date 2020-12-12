class CreateSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :seasonings do |t|
      t.references :user, null:false, foreign_key: true
      t.text :salt
      t.text :sugar
      t.text :soy_sauce
      t.text :liquor
      t.text :miso
      t.text :dashi
      t.text :oil
      t.text :vinegar
      t.text :sauce
      t.text :western
      t.text :chinese
      t.text :spice_herb
      t.text :roux
      t.text :dressing
      t.text :various
      
      t.timestamps
    end
  end
end
