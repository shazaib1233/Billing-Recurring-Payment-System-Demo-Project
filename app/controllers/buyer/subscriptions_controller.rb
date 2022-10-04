class Buyer::SubscriptionsController < Buyer::BaseController
  before_action :set_subscription, only: %i[ show edit update increment_consumed ]

  def increment_consumed
    @subscription.update_attribute(:consumed_units, @subscription.consumed_units+1)
    redirect_to root_path, notice: "Unit Consumed"
  end

  def create
    plan = Plan.find(subscription_params[:plan_id])
    plan.features.each do |feature|
      @subscription = Subscription.create!(subscription_params.merge(feature_id: feature.id))
    end
    redirect_to buyer_plans_path, notice: 'Subscription was successfully created.'
  end

  def destroy
    @subscriptions = Subscription.where(user_id: current_user.id).where(plan_id: params[:id])
    @subscriptions.destroy_all
    redirect_to buyer_plans_path, notice: 'Plan was successfully unsubscribed.'
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:name, :user_id, :plan_id, :feature_id)
  end
end
