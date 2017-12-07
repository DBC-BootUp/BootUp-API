Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :linkedin, ENV['LINKEDIN_CLIENT_ID'], ENV['LINKEDIN_SECRET_KEY'], fields: ['id', 'email-address', 'first-name', 'last-name', 'headline', 'location', 'industry', 'picture-url', 'public-profile-url', 'positions', "picture-urls::(original)"], callback_path: '/api/auth/linkedin/callback', path_prefix: '/api/auth'
end

