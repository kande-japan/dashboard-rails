class SlacksController < ApplicationController
    skip_before_action :authenticate
    def verification
        if params[:type] == "url_verification"
            challenge = params[:challenge]
            render plain: challenge
        else
            render plain: "error"
        end
    end
end
