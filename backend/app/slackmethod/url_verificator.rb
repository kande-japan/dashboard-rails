class UrlVerificator < ApplicationController
  def self.url_verify(params)
    params[:challenge]
  end
end
