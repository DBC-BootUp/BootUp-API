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

  def self.find_or_create_from_auth_hash(auth_hash)
    self.find_or_create_by(uid: auth_hash[:uid]) do |user|
      user.name = auth_hash[:info][:first_name] + ' ' + auth_hash[:info][:last_name]
      user.email = auth_hash[:info][:email]
      # user.description = auth_hash[:info][:description]
      user.location = auth_hash[:info][:location][:name]
      user.photo_url = auth_hash.extra.raw_info.pictureUrls.values[1][0]
      user.linkedin_url = auth_hash[:info][:urls][:public_profile]
      # user.linkedin_token = auth_hash[:credentials][:token]
      # user.linkedin_token_expiration = auth_hash[:credentials][:expires_at]
      user.current_company = auth_hash[:extra][:raw_info][:positions][:values][0][:company][:name]
      user.current_position = auth_hash[:extra][:raw_info][:positions][:values][0][:title]
    end
  end
end
