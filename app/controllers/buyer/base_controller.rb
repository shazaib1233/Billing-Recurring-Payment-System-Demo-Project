class Buyer::BaseController < ApplicationController
  before_action :validate_buyer

  protected

  def validate_buyer
    return if current_user&.buyer?

    redirect_to root_path, alert: 'Invalid Access'
  end

end
