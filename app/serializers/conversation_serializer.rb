class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :name, :user1_id, :user2_id
  has_many :messages
end
