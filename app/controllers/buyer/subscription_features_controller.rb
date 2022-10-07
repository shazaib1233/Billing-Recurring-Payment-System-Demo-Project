class Buyer::SubscriptionFeaturesController < Buyer::BaseController
  before_action :set_subscription
  before_action :set_subscription_feature

  def increment_consumed
    @subscription_feature.increment!(:consumed_units)
    redirect_to root_path, notice: 'Unit Consumed'
  end

  def set_subscription
    @subscription = current_user.subscriptions.find_by(id: params[:subscription_id])
    return if @subscription.present?

    redirect_back fallback_location: root_path, alert: 'Invalid Access'
  end

  def set_subscription_feature
    @subscription_feature = @subscription.subscription_features.find_or_create_by(feature_id: params[:feature_id])
    return if @subscription_feature&.valid?

    redirect_back fallback_location: root_path, alert: 'Invalid Access'
  end
end
