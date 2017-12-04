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

FactoryBot.create_list(:skill, 30)
FactoryBot.create_list(:user, 5)
FactoryBot.create_list(:company, 10)
FactoryBot.create_list(:interview, 50)
