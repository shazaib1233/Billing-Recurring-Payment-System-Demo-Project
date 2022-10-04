class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters
  before_action :validate_admin, only: [:new, :create]

  protected

  def after_invite_path_for(resource)
    admin_users_path
  end

  def validate_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'Invalid Access'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:invite, keys: [:avatar])
  end
end
