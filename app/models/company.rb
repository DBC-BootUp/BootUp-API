class Company < ApplicationRecord
  has_many :interviews
  has_many :interviewees, through: :interviews, source: :user
  has_and_belongs_to_many :skills
end
