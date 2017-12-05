class User < ApplicationRecord
  has_and_belongs_to_many :skills
  has_many :interviews, dependent: :destroy
  has_many :companies_applied_to, through: :interviews, source: :company

  def json_with_associations
    self.as_json(include: {
      skills: {only: [:id, :name]},
      interviews: {include: :company},
      companies_applied_to: {}
    })
  end

  def serializable_hash(options = nil)
    super({except: [:created_at, :updated_at]}.merge(options || {}))
  end
end
