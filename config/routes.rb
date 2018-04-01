Rails.application.routes.draw do
  get 'chats/index'

  resources :users

  telegram_webhooks TelegramWebhooksController, :robo1bot
end
