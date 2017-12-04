class Company < ApplicationRecord
  has_many :interviews
  has_many :interviewees, through: :interviews
  has_and_belongs_to_many :skills
end
