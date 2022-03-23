# frozen_string_literal: true

class SlacksController < ApplicationController
  skip_before_action :authenticate

  TYPE_TO_ACTION = {
    url_verification: UrlVerificator.method(:url_verify),
    event_callback: ContentSaver.method(:content_save)
  }.freeze

  def receiver
    rendered_hash = TYPE_TO_ACTION[params[:type].to_sym].call(params)

    if rendered_hash.is_a?(Hash)
      render(**rendered_hash)
    else
      render
    end
  end
end
