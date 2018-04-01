class Bot1WebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!


  def start(data = nil, *)
    unless User.exists?(chat_id: from['id'])
      user = User.new(
          chat_id: from['id'],
          first_name: from['first_name'])
      user.save

      ActionCable.server.broadcast 'telegram', message: "New user: #{from['first_name']}"
    end

    respond_with :message, text: "Hello, #{from['first_name']}"
  end



  def message(message)
    ActionCable.server.broadcast 'telegram',
                                 message: "#{message['from']['first_name']}: #{message['text']}",
                                 chat_id: message['from']['id']

    user = User.where(chat_id: message['from']['id']).first
    message = user.messages.create(message: message['text'])
    message.save
  end
end
