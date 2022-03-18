class Category < ApplicationRecord
    has_many :contentcategories
    has_many :content, through: :contentcategories
end
