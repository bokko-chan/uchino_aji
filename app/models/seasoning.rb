class Seasoning < ApplicationRecord
  # has_many :user_seasonings, foreign_key: "user_id", dependent: :destroy
  # has_many :users, through: :user_seasonings

  # accepts_nested_attributes_for :user_seasonings, allow_destroy: true


  #オブジェクト名.match(/正規表現/)
#   def self.search(search)
#     if search !=""
#       Seasoning.match()
#     else
#       Seasoning.all
#     end
#   end

end

