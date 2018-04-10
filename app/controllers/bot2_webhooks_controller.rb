class Bot2WebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  context_to_action!

  def initialize(*)
    super
    @bot = 'robo6bot'
  end

  include Bot
end
