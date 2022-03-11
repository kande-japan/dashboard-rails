# frozen_string_literal: true

module Jwt::TokenDecryptor
  class << self
    def decrypt(token)
      raise ApplicationController::AuthenticationError if token.nil?

      begin
        JWT.decode token, Rails.application.credentials.secret_key_base
      rescue StandardError
        raise ApplicationController::AuthenticationError
      end
    end
  end
end
