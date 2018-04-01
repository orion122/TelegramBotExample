Rails.application.routes.draw do
  get 'chats/index'

  resources :users

  telegram_webhooks Bot1WebhooksController, :robo1bot
  telegram_webhooks BotSecondWebhooksController, :robo6bot
end
