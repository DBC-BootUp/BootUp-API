class ApplicationController < ActionController::API
  include ActionController::Cookies
  after_action :cors_set_access_control_headers

  def current_user
    return nil if cookies[:jwt].nil? || cookies[:jwt].empty?
    token = Tokenize.decode(cookies[:jwt])
    User.try(:find_by, {id: token.first['sub']['id']})
  end

  def logged_in?
    !!current_user
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
  end

  def authorize
    render json: {error: "Must be logged in", message: "Login and try again"}, status: 403 if !logged_in?
  end
end
