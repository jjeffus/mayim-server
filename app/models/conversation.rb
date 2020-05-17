class Conversation < ApplicationRecord
  has_many :messages

  before_validation :set_name
  validates_uniqueness_of :name
  validates_presence_of :name, :user1_id, :user2_id

  def set_name
    self.name = channel_name
  end
  def channel_name
    return "#{self.user1_id}_#{self.user2_id}" if self.user1_id < self.user2_id
    "#{self.user2_id}_#{self.user1_id}"
  end
  def add_message(current_user, message_params)
    message_params.delete "conversation"
    message_params.delete "receiver_id"
    message = Message.new(message_params)
    message.user_id = current_user.id
    message.conversation_id = self.id
    return message
  end

  def self.find_or_create_by_message(current_user, message_params)
    logger.info("current_user: #{current_user.inspect}")
    logger.info("message_params: #{message_params.inspect}")
    conversation = Conversation.where(:name => message_params["conversation"]).first
    if conversation
      logger.info("conversation: #{conversation}")
      conversation.last_message = message_params[:text]
      conversation.save!
    else
      conversation = Conversation.new
      if current_user.id < message_params["receiver_id"].to_i
        conversation.user1_id = current_user.id
        conversation.user2_id = message_params["receiver_id"].to_i
      else
        conversation.user1_id = message_params["receiver_id"].to_i
        conversation.user2_id = current_user.id
      end
      logger.info("conversation: #{conversation.inspect}")
      conversation.set_name
      conversation.last_message = message_params[:text]
      conversation.save!
    end
    return conversation
  end
end
