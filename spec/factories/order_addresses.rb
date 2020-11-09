FactoryBot.define do
  factory :order_address do
    token           {"tok_abcdefghijk00000000000000000"}
    postal_code     {"123-4567"}
    prefectures_id  {"2"}
    municipality    {"市川"}
    address         {"1-1-1"}
    building_number {"吉田ビル１F"}
    phone_number    {"09012345678"}
  end
end
