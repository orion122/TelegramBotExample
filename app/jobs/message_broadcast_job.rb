class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    first_name = message.incoming ? message.chat.first_name : 'me'

    ActionCable.server.broadcast 'telegram',
                                 message: "#{first_name}: #{message.message}",
                                 chat_id: message.chat.chat_id
  end
end
