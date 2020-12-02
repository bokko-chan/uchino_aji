class SaltSugar < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '塩' },
    { id: 3, name: '岩塩' },
    { id: 4, name: '藻塩' },
    { id: 5, name: '白砂糖' },
    { id: 6, name: '黒糖' },
    { id: 7, name: 'きび砂糖' },
    { id: 8, name: 'オリゴ糖' },
  ]
 
   include ActiveHash::Associations
   has_many :seasonings
 
end
