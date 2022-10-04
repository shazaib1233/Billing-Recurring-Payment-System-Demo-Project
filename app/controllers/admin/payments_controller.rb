class Admin::PaymentsController < Admin::BaseController
  def create
  end

  def show
  end

  private

  def payment_params
    params.require(:payment).permit(:total)
  end
end
