class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'telegram',
                                 message: "#{message.chat.first_name}: #{message.message}",
                                 chat_id: message.chat.chat_id
  end
end
