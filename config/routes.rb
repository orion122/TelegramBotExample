Rails.application.routes.draw do
  get 'chats/index'

  telegram_webhooks TelegramWebhooksController
end
