class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    validates :explanation
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_day_id
    validates :user,              foreign_key: true
    validates :image
  end
    validates :category_id, numericality: { other_than: 1 }
end
