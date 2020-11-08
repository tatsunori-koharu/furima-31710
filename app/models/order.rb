class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_number, :phone_number
  belongs_to :user
  belongs_to :item
end
