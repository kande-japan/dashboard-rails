class Content < ApplicationRecord
    has_many :contentcategories
    has_many through: :contentcategories
    belongs_to :user
end
