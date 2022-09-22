class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum user_type: { admin: 'admin', buyer: 'buyer' }

  before_create :set_user_type

  private
  def set_user_type
  	if self.created_by_invite?
  		self.user_type = 'buyer'
  	else
  		self.user_type = 'admin'
  	end
  end
end
