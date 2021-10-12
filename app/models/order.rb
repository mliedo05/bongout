class Order < ApplicationRecord
  belongs_to :user
  has_many :carts
  has_many :products,  through: :carts, dependent: :destroy
  has_many :payments, dependent: :destroy

  enum status:[:created, :cancel, :payed, :complete]
end
