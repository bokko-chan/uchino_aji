class UserSeasoning < ApplicationRecord
  belongs_to :user
  belongs_to :seasoning
end
