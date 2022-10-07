class AddStatusToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :status, :string, default: 'pending'
  end
end
