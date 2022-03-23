class SlacksController < ApplicationController

    skip_before_action :authenticate
    TYPE_TO_ACTION = {
        url_verification: UrlVerification.method(:url_verification),
        event_callback: ContentSaving.method(:content_saving)
    }

    def receiving
        #verification
        if params[:type] == "url_verification"
            TYPE_TO_ACTION[url_verification].call(params)
        end

        #getting content
        TYPE_TO_ACTION[params[:event][:type]].call(params)
    
    end

end