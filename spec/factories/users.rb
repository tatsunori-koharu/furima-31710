FactoryBot.define do
  factory :user do
    nickname                              { Faker::Name.initials }
    email                                 { Faker::Internet.free_email }
    password                              { 'iii999' }
    password_confirmation                 { password }
    first_name                            { '山' }
    first_name_furigana                   { 'ヤマ' }
    last_name                             { '川' }
    last_name_furigana                    { 'カワ' }
    birthday                              { Faker::Date.birthday }
  end
end
