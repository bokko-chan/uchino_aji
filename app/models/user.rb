class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :seasoning

  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } #半角英数混合
  
    # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    # validates :password
    # def password_custom_error
    #   if password.blank?  
    #     errors[:base] << "パスワードを入力してください"
    #   elsif password.match(VALID_PASSWORD_REGEX) == nil
    #     errors[:base] << "パスワードは半角英数6文字以上で入力してください"
    #   end
    # end
  end
end
