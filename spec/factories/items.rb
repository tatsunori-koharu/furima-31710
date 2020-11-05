FactoryBot.define do
  factory :item do
    name                {Faker::Name.name}
    price               {100000}
    explanation         {Faker::Lorem.sentence}
    image               {Faker::Lorem.sentence}
    category_id         { 2 }
    status_id           { 2 }
    shipping_fee_id     { 2 }
    shipping_area_id    { 2 }
    shipping_day_id     { 2 }
    association :user
  end
end