class Bot1WebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  @@bot = 'robo1bot'

  def start(data = nil, *)
    unless Chat.exists?(chat_id: from['id'])
      chat = Chat.new(
          chat_id: from['id'],
          first_name: from['first_name'])
      chat.save

      ActionCable.server.broadcast 'telegram', message: "New user: #{from['first_name']}"
    end

    respond_with :message, text: "Hello, #{from['first_name']}"
  end



  def message(message)
    ActionCable.server.broadcast 'telegram',
                                 message: "#{message['from']['first_name']}: #{message['text']}",
                                 chat_id: message['from']['id']

    chat = Chat.where(chat_id: message['from']['id']).first
    message = chat.messages.create(message: message['text'], bot: @@bot)
    message.save
  end

end
