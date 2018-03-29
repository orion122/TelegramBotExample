Rails.application.routes.draw do
  get 'chats/index'

  get 'chat/index'

  get 'chats/index'
  telegram_webhooks TelegramWebhooksController
end
