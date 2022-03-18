class SlacksController < ApplicationController
    skip_before_action :authenticate
    def receiving

        #verification
        if params[:type] == "url_verification"
            challenge = params[:challenge]
            render plain: challenge
        else
            render plain: "error"
        end

        #getting content
        new_text = params[:event][:text]
        user = params[:event][:user]
        content = Content.new(text = new_text, name = user)
        content.save
    end
end
