class SlackUserSerializer < ActiveModel::Serializer
  attributes :display_name
  has_many :content, serializer: ContentSerializer
end
