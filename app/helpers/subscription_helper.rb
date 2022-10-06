module SubscriptionHelper

  def get_allocated_units(plan, feature)
    FeaturePlan.where(plan_id: plan, feature_id: feature).first.allocated_units
  end

  def get_subscription_feature(subscription, feature)
    SubscriptionFeature.where(subscription_id: subscription, feature_id: feature).first
  end

end
