class Feature < ApplicationRecord
  has_many :feature_plans, dependent: :destroy
  has_many :plans, through: :feature_plans
  has_many :subscription_features, dependent: :destroy
end
