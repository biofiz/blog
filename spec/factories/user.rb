FactoryGirl.define do
  factory :user do
    username       { Faker::Internet.user_name }
    email          { Faker::Internet.safe_email }
    password       { Faker::Internet.password(8) }
    confirmed_at   { Time.now }
  end
end
