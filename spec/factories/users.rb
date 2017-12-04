require 'faker'

COHORTS = ['Bumblebees', 'Fiddler Crabs', 'Rock Doves', 'Fiery Skippers', 'Golden Bears', 'Red Pandas', 'Nighthawks', 'Pocket Gophers', 'Sea Lions', 'Fireflies', 'Foxes', 'Wild Pigs', 'Chorus Frogs', 'Squirrels', 'Otters', 'Jackrabbits', 'Bobolinks', 'Coyotes', 'Chipmunks', 'Salamanders', 'Wolves', 'Copperheads', 'Dragonflies', 'Purple Martins', 'Mud Turtles', 'Cicadas', 'Grasshoppers', 'Island Foxes', 'Grey Racoons', 'Desert Rabbits', 'Brown Bats', 'Largemouth Basses', 'Pocket Mice', 'Mule Deer', 'Tiger Swallowtails', 'Gopher Snakes', 'Fence Lizards', 'Red Admirals', 'Banana Slugs', 'Fox Squirrels']

FactoryBot.define do
  factory :user do
    transient { skill_count 4 }

    name { Faker::Name.name }
    year { (2012..2017).to_a.sample }
    cohort { COHORTS.sample }
    location { "#{Faker::Address.city}, #{Faker::Address.state}" }
    email { Faker::Internet.email }
    linkedin_url { Faker::Internet.url('linkedin.com') }
    github_url { Faker::Internet.url('github.com') }
    facebook_url { Faker::Internet.url('facebook.com') }
    current_company { Faker::Company.name }
    current_position { Faker::Company.profession }
    photo_url { Faker::Fillmurray.image }
    skills do
      FactoryBot.create(:skill) until Skill.all.length > skill_count
      Skill.all.sample(skill_count)
    end
  end
end
