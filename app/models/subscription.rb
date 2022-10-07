class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  has_many :feature_plans, through: :plan
  has_many :subscription_features, dependent: :destroy

  validates :user_id, uniqueness: { scope: :plan_id, message: 'Can not subscribed to same plan again !' }

  def features_data
    feature_plans.map do |feature_plan|
      {
        feature_plan: feature_plan,
        subscription_feature: subscription_features.find { |sub_feature| sub_feature.feature_id == feature_plan.feature.id } || subscription_features.new(feature: feature_plan.feature)
      }
    end
  end
end
