class Buyer::SubscriptionsController < Buyer::BaseController
  before_action :set_subscription, only: %i[ show edit update destroy]

  def create
    @subscription = Subscription.create!(subscription_params)
    redirect_to buyer_plans_path, notice: 'Subscription was successfully created.'
  end

  def destroy
    @subscription.destroy
    redirect_to buyer_plans_path, notice: 'Plan was successfully unsubscribed.'
  end

  private

  def set_subscription
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:name, :user_id, :plan_id)
  end
end
