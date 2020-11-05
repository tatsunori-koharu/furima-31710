class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname, uniqueness: true
          validates :email, uniqueness: true
          validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角の英字と数字を含んでください' }
          validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
          validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
          validates :first_name_furigana, format: { with: /\A[ァ-ヶーー]+\z/, message: '全角カナを使用してください' }
          validates :last_name_furigana, format: { with: /\A[ァ-ヶーー]+\z/, message: '全角カナを使用してください' }
          validates :birthday
         end
  
end
