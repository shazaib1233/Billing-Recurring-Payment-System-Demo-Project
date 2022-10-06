class Subscription < ApplicationRecord
  has_many :subscription_features, dependent: :destroy
  belongs_to :user
  belongs_to :plan

  validates :user_id, uniqueness: { scope: :plan_id, message: 'Can not subscribe to same plan again !' }
end
