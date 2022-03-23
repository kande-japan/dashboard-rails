# frozen_string_literal: true

# Slack URL Verificator
class UrlVerificator < ApplicationController
  def self.url_verify(params)
    { plain: params[:challenge] }
  end
end
