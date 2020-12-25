class Seasoning < ApplicationRecord
  # has_many :user_seasonings, foreign_key: 'user_id', dependent: :destroy
  # has_many :users, through: :user_seasonings
end

