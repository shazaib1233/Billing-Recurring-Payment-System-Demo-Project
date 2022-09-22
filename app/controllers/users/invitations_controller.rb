class Users::InvitationsController < Devise::InvitationsController
  before_action :validate_inviter

  private

  def validate_inviter
  	if user_signed_in? && current_user.buyer?
      redirect_to root_path, alert: 'Invalid Access'
    end
  end
end
