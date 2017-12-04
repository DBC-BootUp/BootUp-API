class Company < ApplicationRecord
  has_many :interviews
  has_many :interviewees, through: :interviews
  has_and_belongs_to_many :skills

  def serializable_hash(options = nil)
    super({except: [:created_at, :updated_at]}.merge(options || {}))
  end
end
