require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    username Faker::Name.name
  end

  factory :item do
    name Faker::Lorem.word
    buy_price Faker::Number.decimal(2)
    sell_price Faker::Number.decimal(2)
    region Faker::Number.number(7)
    eve_type Faker::Number.number(5)
    info_date Faker::Time.between(DateTime.now - 1, DateTime.now)
  end

end
