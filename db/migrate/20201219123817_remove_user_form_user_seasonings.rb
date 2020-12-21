class RemoveUserFormUserSeasonings < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key :user_seasonings, :users
    remove_foreign_key :user_seasonings, :seasonings
  end

  def down
    add_foreign_key :user_seasonings, :users
    add_foreign_key :user_seasonings, :seasonings
  end

end
