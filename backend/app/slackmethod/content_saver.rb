class ContentSaver
  def self.content_save(params)
    new_text = params[:event][:text]
    user = params[:event][:user]
    content = Content.new(text: new_text, name: user)
    content.save
  end
end
