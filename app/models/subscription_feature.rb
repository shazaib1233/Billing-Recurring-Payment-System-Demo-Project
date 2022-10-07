class SubscriptionFeature < ApplicationRecord
  belongs_to :feature
  belongs_to :subscription
end
