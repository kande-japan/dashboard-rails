# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate

  serialization_scope :view_context

  # Authentication Error
  class AuthenticationError < StandardError; end

  rescue_from AuthenticationError, with: :not_authenticated

  def authenticate
    raise AuthenticationError unless current_user
  end

  def current_user
    @current_user ||= UserAuthenticator.authenticated_user(request.headers)
  end

  private

  def not_authenticated
    puts 'not authenticated'
    render json: { message: 'Authentication Failed.' }, status: :unauthorized
  end
end
