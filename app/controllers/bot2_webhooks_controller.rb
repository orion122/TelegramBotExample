class Bot2WebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  @bot = 'robo6bot'

  include Bots
end
