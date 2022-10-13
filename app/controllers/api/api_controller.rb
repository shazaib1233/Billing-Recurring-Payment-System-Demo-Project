class Api::ApiController < ActionController::Base
  include ApiResponse

  respond_to :json
  protect_from_forgery with: :null_session
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :ensure_current_user

  def current_user
    token ||= request.headers['authorization'].presence
    @current_user ||= User.find_by_auth_token(token)
  end

  def not_found
    failure_response(404, 'Not Found')
  end


  def ensure_current_user
    return if current_user.present?

    failure_response(401, 'Authorization Token is missing or expired')
  end
end
