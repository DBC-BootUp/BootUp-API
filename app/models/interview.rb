class Interview < ApplicationRecord
  has_and_belongs_to_many :skills
  belongs_to :company
  belongs_to :interviewee, foreign_key: 'user_id', class_name: 'User'

  def json_with_associations
    self.as_json(include: {
      skills: {only: [:id, :name]},
      interviewee: {},
      company: {}
    })
  end

  # def serializable_hash(options = nil)
  #   super({except: [:created_at, :updated_at]}.merge(options || {}))
  # end
end
