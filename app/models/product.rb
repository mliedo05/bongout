class Product < ApplicationRecord
  belongs_to :subcategory
  belongs_to :brand
  has_many :carts, dependent: :destroy
  has_many :orders,  through: :carts, dependent: :destroy
  ratyrate_rateable "price"
  has_one_attached :image
  def to_s
    name
  end
end
