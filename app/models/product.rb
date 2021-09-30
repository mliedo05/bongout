class Product < ApplicationRecord
  belongs_to :subcategory
  belongs_to :brand
end
