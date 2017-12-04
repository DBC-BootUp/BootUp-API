class User < ApplicationRecord
  has_and_belongs_to_many :skills
  has_many :interviews, dependent: :destroy
  has_many :companies_applied_to, through: :interviews, source: :company
end
