class Bot1WebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  @bot = 'robo1bot'

  include Bots

end
