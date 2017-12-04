FactoryBot.define do
  factory :interview do
    job_title "MyString"
    referred? false
    received_offer? false
    notes "MyText"
    difficulty_rating 1
    experience_rating 1
    accepted_offer? false
    phone_screen? false
    phone_screen_details "MyText"
    tech_screen? false
    tech_screen_details "MyText"
    take_home_challenge? false
    take_home_challenge_details "MyText"
    onsite? false
    onsite_details "MyText"
    whiteboarding? false
    whiteboarding_details "MyText"
    negotiation_details "MyText"
  end
end
