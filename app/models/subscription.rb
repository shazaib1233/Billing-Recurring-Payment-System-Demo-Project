class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  has_many :subscription_features, dependent: :destroy

  validates :user_id, uniqueness: { scope: :plan_id, message: 'Can not subscribew to same plan again !' }
end
