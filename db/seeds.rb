# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Skill.destroy_all
User.destroy_all
Company.destroy_all
Interview.destroy_all

# FactoryBot.create_list(:skill, 30)
# FactoryBot.create_list(:user, 5)
# FactoryBot.create_list(:company, 10)
# FactoryBot.create_list(:interview, 50)

def y_n_to_bool(string)
  string == 'yes'
end

json = File.read('db/data.json')
data = JSON.parse(json)

data.each do |row|
  interviewee = User.find_or_create_by(email: row['email']) do |user|
    user.email = row['email']
    user.name = row['name']
  end
  company = Company.find_or_create_by(name: row['company_name']) {|company| company.name = row['company_name']}


  Interview.create(
    interviewee: interviewee,
    company: company,
    job_title: row['position'],
    difficulty_rating: row['difficulty_rating'],
    experience_rating: row['experience_rating'],
    referred: y_n_to_bool(row['referred']),
    received_offer: y_n_to_bool(row['received_offer']),
    accepted_offer: y_n_to_bool(row['accepted_offer']),
    phone_screen: y_n_to_bool(row['phone_screen']),
    phone_screen_details: row['phone_screen_details'],
    tech_screen: y_n_to_bool(row['tech_screen']),
    tech_screen_details: row['tech_screen_details'],
    take_home_challenge: y_n_to_bool(row['take_home_challenge']),
    take_home_challenge_details: row['take_home_challenge_details'],
    onsite: y_n_to_bool(row['onsite']),
    onsite_details: row['onsite_details'],
    whiteboarding: y_n_to_bool(row['whiteboarding']),
    whiteboarding_details: row['whiteboarding_details'],
    negotiation_details: row['negotiation_details'],
    notes: row['notes']
  )

end
