# frozen_string_literal: true

module Jwt::TokenProvider
  class << self
    def issue(payload)
      JWT.encode payload, Rails.application.credentials.secret_key_base, 'HS256', { typ: 'JWT' }
    end
  end
end
