class Payment < ApplicationRecord
  belongs_to :user

  enum status: { pending: 'pending', paid: 'paid' }

  def self.calculate_total(user)
    total = 0

    User.find(user).subscriptions.each do |subscription|
      total += subscription.plan.monthly_fee
      subscription.plan.feature_plans.each do |feature_plan|
        subscription_feature = subscription.subscription_features.find { |subscription_feature| subscription_feature.feature_id == feature_plan.feature.id }
        if subscription_feature
          consumed = subscription_feature.consumed_units
        else
          consumed = 0
        end
        allocated = feature_plan.allocated_units
        difference = consumed - allocated
        if difference > 0
          total += difference * feature_plan.feature.unit_price
        end
      end
    end

    total
  end
end
