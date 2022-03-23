class UrlVerification
    def self.url_verification(params)
        challenge = params[:challenge]
        render plain: challenge
    end 
end
