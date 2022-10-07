class ApplicationController < ActionController::Base
  include ExceptionHandler
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    return admin_users_path if current_user.admin?
    return buyer_plans_path if current_user.buyer?

    root_path
  end

  def after_accept_path_for(_resource)
    return admin_users_path if current_user.admin?
    return buyer_plans_path if current_user.buyer?

    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar])
  end
end
