class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "telegram"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def reply(data)
    ActionCable.server.broadcast 'telegram',
                                 message: data['message'],
                                 chat_id: data['chat_id']

    Telegram.bot.send_message(chat_id: data['chat_id'], text: data['message'])
  end
end
