class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :feature

  validates :user_id, uniqueness: { scope: [:plan_id, :feature_id], message: 'Can not subscribe to same plan again !' }
end
