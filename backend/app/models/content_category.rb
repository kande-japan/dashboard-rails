class ContentCategory < ApplicationRecord
  belongs_to :content
  belongs_to :category
  belongs_to :user
end
