class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefectures_id, :municipality, :address, :building_number, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は( - )をお入れ下さい' }
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}+\z/, message: "は半角英数字でご入力下さい"}
  end
  validates :prefectures_id, numericality: { other_than: 0, message: "は[---]意外をお選び下さい" }
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_number: building_number, phone_number: phone_number, order_id: order.id)
  end
end
