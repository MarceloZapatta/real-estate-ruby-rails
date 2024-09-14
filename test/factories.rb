FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    active { true }
    password { "password" }
  end

  factory :office do
    name { Faker::Name.name }
    active { true }
  end
end