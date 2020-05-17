class Api::V1::MessagesController < Api::V1::ApiController
  skip_before_action :verify_authenticity_token

  def create
    conversation = Conversation.find_or_create_by_message(current_user, message_params)
    message = conversation.add_message(current_user, message_params)
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to conversation, serialized_data
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :conversation, :receiver_id)
  end
end
