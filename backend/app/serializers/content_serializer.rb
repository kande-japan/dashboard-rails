class ContentSerializer < ActiveModel::Serializer
  attributes :text, :created_at, :updated_at
  belongs_to :slack_user, serializer: SlackUserSerializer
end
