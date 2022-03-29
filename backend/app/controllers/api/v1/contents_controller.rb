class Api::V1::ContentsController < ApplicationController
  skip_before_action :authenticate

  def index
    @contents_with_users = Content.preload(:slack_user)
    render json: @contents_with_users, each_serializer: ContentSerializer
  end
end
