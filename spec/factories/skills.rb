FactoryBot.define do
  factory :skill do
    name { Faker::Company.catch_phrase }
  end
end
