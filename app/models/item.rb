class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'は半角英数字でご入力ください' }
    validates :explanation, length: { maximum: 1000 }
    validates :image
  end
  with_options numericality: { other_than: 1, message: "は[---]意外をお選びください" } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は範囲内でご入力ください' }
end
