class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :destroy

  validates :name, :category, presence: true
end
