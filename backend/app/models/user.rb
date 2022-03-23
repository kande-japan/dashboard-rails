# frozen_string_literal: true

class User < ApplicationRecord
  include UuidGenerator

  has_one :slack_user

  # secure password
  has_secure_password

  # email validation
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  #association
  has_many :students
end
