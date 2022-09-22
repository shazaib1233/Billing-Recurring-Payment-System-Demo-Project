class Admin::UsersController < ApplicationController
  before_action :validate_admin

  private

  def validate_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'Invalid Access'
  end
end
