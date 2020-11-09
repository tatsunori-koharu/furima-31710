FactoryBot.define do
  factory :item do
    name                { Faker::Name.name }
    price               { 100000 }
    explanation         { Faker::Lorem.sentence }
    category_id         { 2 }
    status_id           { 2 }
    shipping_fee_id     { 2 }
    shipping_area_id    { 2 }
    shipping_day_id     { 2 }
    after(:build) do |test|
      test.image.attach(io: File.open('public/images/item_sample.png'), filename: 'item_sample.png')
    end
    association :user
  end
end
