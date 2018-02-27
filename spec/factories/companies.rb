FactoryBot.define do
  factory :company do
    transient { skill_count 4 }

    name { Faker::Company.name }
    location { "#{Faker::Address.city}, #{Faker::Address.state}" }
    website { Faker::Internet.url }
    tech_field { Faker::Company.catch_phrase }
    has_apprenticeship { [true, false].sample }
    skills do
      FactoryBot.create(:skill) until Skill.all.length > skill_count
      Skill.all.sample(skill_count)
    end
  end
end
