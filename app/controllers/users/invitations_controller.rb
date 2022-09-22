class Users::InvitationsController < Devise::InvitationsController
  before_action :validate_admin, only: [:new, :create]

  private
  
  def validate_admin
    return if current_user&.admin?
    
    redirect_to root_path, alert: 'Invalid Access'
  end
end
