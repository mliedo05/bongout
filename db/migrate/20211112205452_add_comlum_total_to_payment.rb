class AddComlumTotalToPayment < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :total, :float
    add_column :payments, :token, :string
  end
end
