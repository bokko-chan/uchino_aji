class UserSeasoning < ApplicationRecord
  belongs_to :user #, optional: true
  belongs_to :seasoning #, optional: true
end
