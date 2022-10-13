class Buyer::BillsController < Buyer::BaseController
  def index
    @bills = current_user.payments.pending
  end

  def pay_bill
    current_user.payments.find(params[:id]).paid!

    redirect_to buyer_bills_path, notice: 'Bill Paid'
  end

end
