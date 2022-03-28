class Api::V1::ContentsController < ApplicationController
  skip_before_action :authenticate

  def index
    @contents = Content.all.to_a

    @texts =  @contents.map do |content|
      content.text
    end

    @ids = @contents.map do |content|
      content.slack_user_id
    end
    @usernames = @ids.map do |id|
      SlackUser.find(id).display_name
    end

    # render json: @texts, @usernames
    render json: @texts
  end
end
