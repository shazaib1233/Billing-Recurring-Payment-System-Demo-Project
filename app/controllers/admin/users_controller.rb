class Admin::UsersController < ApplicationController
  before_action :validate_admin

  def index
    @users = User.all
    @plans = Plan.all
  end

  private

  def validate_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'Invalid Access'
  end
end
