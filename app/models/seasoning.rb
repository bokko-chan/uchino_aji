class Seasoning < ApplicationRecord
  # before_validation :delete_name_null

  has_many :user_seasonings
  has_many :users, through: :user_seasonings
  # accepts_nested_attributes_for :user_seasonings, allow_destroy: true

  # validates :name, presence: true
  #オブジェクト名.match(/正規表現/)
#   def self.search(search)
#     if search !=""
#       Seasoning.match()
#     else
#       Seasoning.all
#     end
#   end

# private
#   def delete_name_null
#     # self.name = name.strip
#     if seasoning.name = null
#     end
#   end

end

