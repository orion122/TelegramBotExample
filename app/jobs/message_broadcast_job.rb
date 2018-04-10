class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    first_name = message.incoming ? 'me' : message.chat.first_name

    ActionCable.server.broadcast 'telegram',
                                 message: "#{first_name}: #{message.message}",
                                 chat_id: message.chat.chat_id
  end
end
