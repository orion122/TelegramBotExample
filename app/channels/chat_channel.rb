class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "telegram"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def reply(data)
    msg = data['message'].split[1]

    ActionCable.server.broadcast 'telegram',
                                 message: msg,
                                 chat_id: data['chat_id']

    Telegram.bot.send_message(chat_id: data['chat_id'], text: data['message'])

    user = User.find(1)
    message = user.messages.create(send_to: data['chat_id'], message: msg)
    message.save
  end
end
