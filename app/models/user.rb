class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :email, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角の英字と数字を含んでください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :first_name_furigana, format: { with: /\A[ァ-ヶーー]+\z/, message: '全角カナを使用してください' }
    validates :last_name_furigana, format: { with: /\A[ァ-ヶーー]+\z/, message: '全角カナを使用してください' }
    validates :birthday
  end

  has_many :orders
  has_many :items
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
