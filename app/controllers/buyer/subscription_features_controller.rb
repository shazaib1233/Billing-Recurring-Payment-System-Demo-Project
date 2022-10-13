class Buyer::SubscriptionFeaturesController < Buyer::BaseController
  before_action :set_subscription

  def increment_consumed
    @subscription_feature = @subscription.subscription_features.find_or_create_by(feature_id: params[:feature_id])
    @subscription_feature.increment!(:consumed_units)

    respond_to do |format|
      format.js
    end
  end

  def set_subscription
    @subscription = current_user.subscriptions.find_by(id: params[:subscription_id])
    return if @subscription.present?

    redirect_back fallback_location: root_path, alert: 'Invalid Access'
  end
end
