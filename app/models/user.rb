class User < ApplicationRecord
  has_and_belongs_to_many :skills
  has_many :interviews
end
