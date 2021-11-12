class Order < ApplicationRecord
  belongs_to :user
  has_many :carts, dependent: :destroy
  has_many :products,  through: :carts, dependent: :destroy
  has_many :payments, dependent: :destroy

  enum status:[:created, :cancel, :payed, :complete]

  def add_product(product_id, quantity)
    product = Product.find(product_id)
    cart = self.carts.find_by_product_id(product.id)
    if product && (product.stock > 0)
      if cart.nil?
        carts.create(product_id: product.id, quantity: quantity, price: product.price )
      else
        cart.update_attribute(:quantity, cart.quantity + 1)
      end
      compute_total
    end
  end


  def compute_total
    total = 0
    if self.carts.length != 0
      self.carts.map do |i|
      total += i.price * i.quantity
      end
    end
    update_attribute(:total, total)
  end
end
