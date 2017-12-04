class Skill < ApplicationRecord
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :users
  has_and_belongs_to_many :interviews

  def serializable_hash(options = nil)
    super({except: [:created_at, :updated_at]}.merge(options || {}))
  end
end
