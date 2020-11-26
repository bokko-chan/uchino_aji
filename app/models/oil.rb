class Oil < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
  ]
 
   include ActiveHash::Associations
   has_many :seasonings
 
end
