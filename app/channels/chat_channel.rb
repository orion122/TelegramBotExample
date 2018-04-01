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

    ActionCable.server.broadcast 'telegram',
                                 message: "#{my_name}: #{msg}",
                                 chat_id: chat_id

    bot = User.where(chat_id: chat_id).first.messages.last.bot

    if bot == 'robo1bot'
      Telegram.bots[:robo1bot].send_message(chat_id: data['chat_id'], text: msg)
    else
      Telegram.bots[:robo6bot].send_message(chat_id: data['chat_id'], text: msg)
    end


    user = User.where(chat_id: chat_id).first
    message = user.messages.create(incoming: false, message: msg)
    message.save
  end
end
