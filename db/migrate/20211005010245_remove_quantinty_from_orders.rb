class RemoveQuantintyFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :quantinty
  end
end
