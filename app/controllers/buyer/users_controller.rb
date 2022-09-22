class Buyer::UsersController < ApplicationController
  before_action :validate_buyer

  private

  def validate_buyer
    return if current_user&.buyer?
    redirect_to root_path, alert: 'Invalid Access'
  end
end
