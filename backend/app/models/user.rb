# frozen_string_literal: true

class User < ApplicationRecord
  include UuidGenerator

  # secure password
  has_secure_password

  # email validation
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
