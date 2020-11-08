class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :municipality, :address, :building_number, :phone_number, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}+\z/ }
  end

  def save
    Order.create(token: token)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_number: building_number, phone_number: phone_number)
  end
end