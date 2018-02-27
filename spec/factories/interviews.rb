FactoryBot.define do
  factory :interview do
    transient { skill_count 4 }

    job_title "MyString"
    referred { [true, false].sample }
    received_offer false
    notes "MyText"
    difficulty_rating { (1..3).to_a.sample }
    experience_rating { (1..3).to_a.sample }
    accepted_offer { [true, false].sample }
    phone_screen { [true, false].sample }
    phone_screen_details { Faker::Hacker.say_something_smart }
    tech_screen { [true, false].sample  }
    tech_screen_details { Faker::Hacker.say_something_smart }
    take_home_challenge { [true, false].sample  }
    take_home_challenge_details { Faker::Hacker.say_something_smart }
    onsite { [true, false].sample  }
    onsite_details { Faker::Hacker.say_something_smart }
    whiteboarding { [true, false].sample  }
    whiteboarding_details { Faker::Hacker.say_something_smart }
    negotiation_details { Faker::Hacker.say_something_smart }

    interviewee { User.all.sample || FactoryBot.create(:user) }
    company { Company.all.sample || FactoryBot.create(:company) }
    skills do
      FactoryBot.create(:skill) until Skill.all.length > skill_count
      Skill.all.sample(skill_count)
    end
  end
end
