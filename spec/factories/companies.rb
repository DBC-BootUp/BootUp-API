FactoryBot.define do
  factory :company do
    name { Faker::Company.name }
    location { "#{Faker::Address.city}, #{Faker::Address.state}" }
    website { Faker::Internet.url }
    tech_field { Faker::Company.catch_phrase }
    has_apprenticeship? { [true, false].sample }
    association :interview
    association :interviewees, factory: :user
  end
end
