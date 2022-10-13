class Api::V1::RegistrationsController < Api::ApiController
  skip_before_action :ensure_token

  def create
    @user = User.new(user_params)
    @user.avatar.attach(io: File.open('app/assets/images/picture.png'), filename: 'pic.png')

    if @user.save
      success_response(user: { id: @user.id, email: @user.email, user_type: @user.user_type })
    else
      failure_response(400, @user.errors.full_messages.to_sentence)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end
end
