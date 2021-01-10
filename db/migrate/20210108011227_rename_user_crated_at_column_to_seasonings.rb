class RenameUserCratedAtColumnToSeasonings < ActiveRecord::Migration[6.0]
  def change
    rename_column :seasonings, :user_crated_at, :user_created_at
  end
end
