class Bot2WebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  @@bot = 'robo1bot'

  def start(data = nil, *)
    unless Chat.exists?(chat_id: from['id'])
      Chat.create(chat_id: from['id'], first_name: from['first_name'])
    end

    respond_with :message, text: "Hello, #{from['first_name']}"
  end


  def message(message)
    chat = Chat.where(chat_id: message['from']['id']).first
    chat.messages.create(message: message['text'], bot: @@bot)
  end
end
