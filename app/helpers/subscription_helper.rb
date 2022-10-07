module SubscriptionHelper

  def get_allocated_units(plan, feature)
    FeaturePlan.where(plan_id: plan, feature_id: feature).first.allocated_units
  end

  def get_subscription_feature(subscription_features, feature_id)
    subscription_features.find { |subscription_feature| subscription_feature.feature_id == feature_id }
  end
end
