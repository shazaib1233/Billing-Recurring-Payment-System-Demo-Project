class Users::InvitationsController < Devise::InvitationsController
    before_action :check_admin

private
def check_admin
    if user_signed_in?
      if current_user.buyer?
        redirect_to buyer_users_path, alert: 'Buyer is not allowed to access this part of the site, Redirecting to home page'
      end
    end
  end

end