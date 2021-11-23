class AddComlumCodeToPaymentMethods < ActiveRecord::Migration[5.2]
  def change
    add_column :payment_methods, :code, :string
  end
end
