class Buyer::SubscriptionFeaturesController < Buyer::BaseController

  def increment_consumed
    @subscription_feature = SubscriptionFeature.find_or_create_by(subscription_feature_params)
    @subscription_feature.update_attribute(:consumed_units, @subscription_feature.consumed_units + 1)
    redirect_to root_path, notice: 'Unit Consumed'
  end

  def subscription_feature_params
    params.require(:subscription_feature).permit(:subscription_id, :feature_id, :consumed_units)
  end

end
