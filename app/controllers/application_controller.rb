class ApplicationController < ActionController::Base
  include ExceptionHandler

  def after_sign_in_path_for(_resource)
    return admin_users_path if current_user.admin?
    return buyer_users_path if current_user.buyer?

    root_path
  end

  def after_accept_path_for(_resource)
    return admin_users_path if current_user.admin?
    return buyer_users_path if current_user.buyer?

    root_path
  end
end
