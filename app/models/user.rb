class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, validate_on_invite: true

  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions
  has_many :payments, dependent: :destroy
  has_many :subscription_features, through: :subscriptions

  has_one_attached :avatar

  validates :avatar, content_type: [:png, :jpg, :jpeg], attached: true, size: { less_than: 1.megabytes, message: 'should be less than 1 mb' }

  enum user_type: { admin: 'admin', buyer: 'buyer' }

  before_create :set_user_type

  def generate_auth_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def set_user_type
    return if self.user_type.present?
    return self.user_type = 'buyer' if created_by_invite?

    self.user_type = 'admin'
  end
end
