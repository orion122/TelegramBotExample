class Bot1WebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  def initialize(*)
    super
    @bot = 'robo1bot'
  end

  include Bot
end
