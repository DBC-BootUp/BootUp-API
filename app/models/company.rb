class Company < ApplicationRecord
  has_many :interviews
  has_many :interviewees, through: :interviews
  has_and_belongs_to_many :skills
  multisearchable against: [:name, :location, :website, :tech_field, :has_apprenticeship, :created_at, :updated_at]
  pg_search_scope :search_name, :against => :name


  def serializable_hash(options = nil)
    super({except: [:created_at, :updated_at]}.merge(options || {}))
  end

  def json_with_association
    self.as_json(include: {
    skills: {only: [:id, :name]},
    interviews: {include: {interviewee: {}, company: {}}},
    interviewees: {}
  })
  end
end
