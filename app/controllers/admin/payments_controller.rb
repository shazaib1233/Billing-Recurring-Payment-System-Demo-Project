class Admin::PaymentsController < Admin::BaseController
  def create
    id = payment_params[:user_id]
    total = Payment.calculate_total(id)
    if Payment.create!(payment_params.merge(total: total))
      redirect_to admin_usage_path(id), notice: 'Bill Generated Successfully !'
    else
      redirect_to admin_usage_path(id), alert: 'Bill Generation Failed !'
    end
  end

  def show
    @user = User.find(params[:id])
    @bills = @user.payments
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to admin_payment_path(params[:user_id]), notice: 'Bill deleted'
  end

  private

  def payment_params
    params.require(:payment).permit(:total, :user_id)
  end
end
