class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :encrypted_password, length: {minimum: 6 }, format:{ with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i), message: '６文字以上の半角英数字' }
          validates :frist_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
          validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
          validates :frist_name_furigana, format: { with: /\A[ア-ケーー]+\z/, message: '全角カナを使用してください' }
          validates :last_name_furigana, format: { with: /\A[ア-ケーー]+\z/, message: '全角カナを使用してください' }
          validates :birthday
         end
  
end
