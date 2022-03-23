class SlacksController < ApplicationController
  skip_before_action :authenticate
  TYPE_TO_ACTION = {
    url_verification: UrlVerificator.method(:url_verify),
    event_callback: ContentSaver.method(:content_save)
  }

  def receiver
    render(**{ plain: TYPE_TO_ACTION[params[:type].to_sym].call(params) })
  end
end
