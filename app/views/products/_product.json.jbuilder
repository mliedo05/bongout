json.extract! product, :id, :name, :image, :description, :price, :sku, :stock, :cost, :subcategory_id, :brand_id, :created_at, :updated_at
json.url product_url(product, format: :json)
