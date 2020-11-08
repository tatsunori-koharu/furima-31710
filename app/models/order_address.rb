class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_number, :phone_number

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number
  end