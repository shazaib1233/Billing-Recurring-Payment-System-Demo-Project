class HomeController < ApplicationController
  before_action :check_user_type

  private

  def check_user_type
    if current_user.present?
      return redirect_to admin_users_path if current_user&.admin?

      redirect_to buyer_plans_path
    end
  end
end
