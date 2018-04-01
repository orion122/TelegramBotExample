class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "telegram"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def reply(data)
    msg = data['message']
    chat_id = data['chat_id']

    ActionCable.server.broadcast 'telegram',
                                 message: msg,
                                 chat_id: chat_id

    Telegram.bot.send_message(chat_id: data['chat_id'], text: data['message'])

    user = User.find(chat_id)
    message = user.messages.create(incoming: false, message: msg.split[1])
    message.save
  end
end
