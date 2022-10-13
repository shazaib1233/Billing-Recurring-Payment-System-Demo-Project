class Api::V1::SessionsController < Api::ApiController
  skip_before_action :ensure_token, only: :create

  def create
    resource = User.find_for_database_authentication(email: params.dig(:user, :email))
    return invalid_login_attempt_response unless resource && resource.valid_password?(params.dig(:user, :password))

    resource.generate_auth_token!
    resource.save
    sign_in('user', resource)
    success_response(user: { id: resource.id, email: resource.email, user_type: resource.user_type, auth_token: resource.auth_token })
  end

  def destroy
    sign_out(current_user)
    current_user.update_attribute(:auth_token, nil)
    success_response(message: "#{current_user.email} has been Logged Out Successfully")
  end

  protected

  def invalid_login_attempt_response
    warden.custom_failure!
    failure_response(400, 'Error with your email or password')
  end
end
