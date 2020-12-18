class DSeasoningSaltSugar < ActiveRecord::Migration[6.0]
  def up
    drop_table :seasoning_salt_sugars
  end
end
