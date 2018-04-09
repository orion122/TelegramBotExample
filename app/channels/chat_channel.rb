class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "telegram"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def reply(data)
    my_name = data['my_name']
    msg = data['message']
    chat_id = data['chat_id']

    last_bot = Chat.last_bot

    if last_bot == 'robo1bot'
      Telegram.bots[:robo1bot].send_message(chat_id: data['chat_id'], text: msg)
    else
      Telegram.bots[:robo6bot].send_message(chat_id: data['chat_id'], text: msg)
    end

    ActionCable.server.broadcast 'telegram',
                                 message: "#{my_name}: #{msg}",
                                 chat_id: chat_id

    chat = Chat.where(chat_id: chat_id).first
    message = chat.messages.create(incoming: false, message: msg)
    message.save
  end
end
