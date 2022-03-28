# frozen_string_literal: true

class SlackUser < ApplicationRecord
  belongs_to :user, optional: true
  has_many :content
end
