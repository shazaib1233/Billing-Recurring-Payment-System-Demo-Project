class Buyer::UsersController < ApplicationController
  before_action :validate_buyer

  def index
    @plans = Plan.all
    @subscriptions = Subscription.where(user_id: current_user.id)
  end

  private

  def validate_buyer
    return if current_user&.buyer?

    redirect_to root_path, alert: 'Invalid Access'
  end
end
