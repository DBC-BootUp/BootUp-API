class Interview < ApplicationRecord
  has_and_belongs_to_many :skills
  belongs_to :company
  belongs_to :interviewee, foreign_key: 'user_id', class_name: 'User'
end
