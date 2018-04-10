class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "telegram"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def reply(data)
    msg     = data['message']
    chat_id = data['chat_id']

    last_bot = Chat.last_bot(chat_id)

    Telegram.bots[last_bot.to_sym].send_message(chat_id: data['chat_id'], text: msg)

    chat = Chat.where(chat_id: chat_id).first
    chat.messages.create(incoming: false, message: msg)
  end
end
