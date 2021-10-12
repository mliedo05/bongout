class Product < ApplicationRecord
  belongs_to :subcategory
  belongs_to :brand
  has_many :carts
  has_many :orders,  through: :carts
  def to_s
    name
  end
end
