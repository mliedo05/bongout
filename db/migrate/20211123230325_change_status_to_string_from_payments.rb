class ChangeStatusToStringFromPayments < ActiveRecord::Migration[5.2]
  def change
    change_column :payments, :status, :string
  end
end
