class Admin::BaseController < ApplicationController
  before_action :validate_admin

  protected

  def validate_admin
    return if current_user.admin?

    redirect_to root_path, alert: 'Invalid Access'
  end
end
