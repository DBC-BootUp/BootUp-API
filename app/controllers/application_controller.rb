class ApplicationController < ActionController::API
  include ActionController::Cookies
  after_action :cors_set_access_control_headers

 def cors_set_access_control_headers
   headers['Access-Control-Allow-Origin'] = '*'
   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
   headers['Access-Control-Allow-Headers'] = '*'
 end
end
