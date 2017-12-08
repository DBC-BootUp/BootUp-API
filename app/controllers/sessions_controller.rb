class SessionsController < ApplicationController
  def login
    user = User.find_or_create_from_auth_hash(auth_hash)
    if user.valid?
      token = Tokenize.encode({uid: user.uid, id: user.id})
      cookies[:jwt] = {value: token, httponly: true}
      redirect_to '/interviews'
    else
      flash[:error] = "Login Failed"
      redirect_to '/'
    end
  end

  def logout
    cookies.delete :jwt
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  private

  def linkedin_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :linkedin_image_url,
      :current_title,
      :current_company,
      :usership_company,
      :email
    )
  end
end

