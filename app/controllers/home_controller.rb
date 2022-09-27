class HomeController < ApplicationController
  before_action :check_user_type

  private

  def check_user_type
    return redirect_to admin_users_path if current_user&.admin?
    return redirect_to buyer_users_path if current_user&.buyer?
  end
end
