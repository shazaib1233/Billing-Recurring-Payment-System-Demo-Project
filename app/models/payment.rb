class Payment < ApplicationRecord
  belongs_to :user

  def self.calculate_total(user_id)
    total = 0
    user = User.find(user_id)
    user.subscriptions.each do |subscription|
      plan = subscription.plan
      total += plan.monthly_fee
      plan.features.each do |feature|
        sub_feature = SubscriptionFeature.where(subscription_id: subscription.id, feature_id: feature.id).first
        if sub_feature
          consumed = sub_feature.consumed_units
        else
          consumed = 0
        end
        allocated = FeaturePlan.where(plan_id: plan.id, feature_id: feature.id).first.allocated_units
        difference = consumed - allocated
        if difference > 0
          total += difference * feature.unit_price
        end
      end
    end

    total
  end

end
