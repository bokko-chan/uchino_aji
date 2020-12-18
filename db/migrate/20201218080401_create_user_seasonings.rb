class CreateUserSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_seasonings do |t|
      t.references :user,      type: :bigint, foreign_key: true
      t.references :seasoning, type: :bigint, foreign_key: true
      t.timestamps 
    end
  end
end
