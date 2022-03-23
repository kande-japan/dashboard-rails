
class ContentSaving 
    def self.content_saving(params)
        new_text = pramas[:event][:text]
        user = params[:event][:user]
        content = Content.new(text = new_text, name = user)
        content.save
    end
end
