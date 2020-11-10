class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :municipality, :address, :building_number, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}+\z/ }
  end
  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_number: building_number, phone_number: phone_number, order_id: order.id)
  end
end
