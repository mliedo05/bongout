class Order < ApplicationRecord
  belongs_to :user
  has_many :carts, dependent: :destroy
  has_many :products,  through: :carts, dependent: :destroy
  has_many :payments, dependent: :destroy

  enum status:[:created, :cancel, :payed, :complete]

  def add_product(product_id, quantity)

    product = Product.find(product_id)
    if product && product.stock > 0
    carts.create(product_id: product_id, quantity: quantity, price: product.price)
    end
  end

  def compute_total
    sum = 0
    carts.each do |item|
      sum += item.price
    end
    update_attribute(:total, sum)
  end
end
