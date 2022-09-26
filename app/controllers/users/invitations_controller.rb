class Users::InvitationsController < Devise::InvitationsController
  before_action :validate_admin, only: [:new, :create]

  private

  def after_invite_path_for(resource)
    admin_users_path
  end

  def validate_admin
    return if current_user&.admin?

    redirect_to root_path, alert: 'Invalid Access'
  end
end
