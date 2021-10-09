class Category < ApplicationRecord
    has_many :subcategories

    def to_s
        name
    end
end
