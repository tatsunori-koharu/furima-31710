class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, length: {maximum: 40 }
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width character."}
    validates :explanation, length: {maximum: 1000 }
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
