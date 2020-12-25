class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :image

  # has_many :user_seasonings, foreign_key: 'seasoning_id'
  # has_many :seasonings, through: :user_seasonings

  # accepts_nested_attributes_for :user_seasonings, allow_destroy: true

  with_options presence: true do
    validates :nickname
    # validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } #半角英数混合
  
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
    validates :password, length: { minimum: 8 }
    def password_custom_error
      if password.blank?  
        errors[:base] << "パスワードを入力してください"
      elsif password.match(VALID_PASSWORD_REGEX) == nil
        errors[:base] << "パスワードは半角英数8文字以上で入力してください"
      end
    end

    # after_validation :remove_unnecessary_error_messages
    # def remove_unnecessary_error_messages
    #   errors.messages.delete(:password)
    # end

  end
end
