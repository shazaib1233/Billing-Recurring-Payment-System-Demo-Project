class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_users_path
    elsif current_user.buyer?
      buyer_users_path
    end
  end

  def after_accept_path_for(resource)
    if current_user.admin?
      admin_users_path
    elsif current_user.buyer?
      buyer_users_path
    end
  end

end
