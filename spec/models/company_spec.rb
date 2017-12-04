require 'rails_helper'

RSpec.describe Company, type: :model do

  let(:company) { Company.create!(
    name: "Paypal",
    location: "Palo Alto",
    website: "paypal.com",
    tech_field: 'fin tech',
    has_apprenticeship: 'false'
    ) }
  let(:interview) { Interview.create!(
    job_title: "Junior Engineer",
    referred: "false",
    received_offer: true,
    notes: "good culture",
    difficulty_rating: 3,
    experience_rating: 2,
    accepted_offer: true,
    phone_screen: true,
    phone_screen_details: "lasted 2 hours",
    tech_screen: true,
    tech_screen_details: "ruby and javascript",
    take_home_challenge: true,
    take_home_challenge_details: "took 8 hours to complete",
    onsite: true,
    onsite_details: "met with 7 people",
    whiteboarding: false,
    whiteboarding_details: "none",
    negotiation_details: "counteroffer accepted",
    ) }
  let(:skill) { Skill.create!(
    name: "javascript"
    )}

  describe "associations" do
    it "has many interviews" do
      expect(company.interviews).to eq interview
    end

    # it { should have_many(:interviewees).through(:interviews)} do

    # end
  end
end
