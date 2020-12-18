class CreateSeasonings < ActiveRecord::Migration[6.0]
  def change
    create_table :seasonings do |t|
      t.string   :name, null: false
      t.datetime :user_crated_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
