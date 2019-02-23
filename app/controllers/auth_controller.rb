class AuthController < ApplicationController
  def current_user
    @current_user ||= authenticate_token
  end

  private
  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end
end
