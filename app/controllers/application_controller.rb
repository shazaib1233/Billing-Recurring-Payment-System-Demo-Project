class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if current_user.admin?
      root_path  
    else
      buyer_users_path
    end
  end

end
