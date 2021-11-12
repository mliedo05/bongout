class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def update_order
    total = 0
    self.order.update_attribute(:total, total) 
  end
end
