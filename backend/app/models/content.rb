class Content < ApplicationRecord
  belongs_to :slack_user
  has_many :content_categories
  has_many :user, through: :content_categories
end
