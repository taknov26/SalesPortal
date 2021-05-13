FactoryBot.define do
  factory :client_company do
    name { Faker::Lorem.characters(number:5) }
  end
end