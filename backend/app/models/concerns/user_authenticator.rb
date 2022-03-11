# frozen_string_literal: true

module UserAuthenticator
  class << self
    def authenticated_user(headers)
      @headers = headers
      payload, = Jwt::TokenDecryptor.decrypt token
      User.find payload['aud']
    end

    private

    def token
      if @headers['Authorization'].nil?
        nil
      else
        @headers['Authorization'].split(' ').last
      end
    end
  end
end
