Rails.application.routes.draw do
  resources :chats

  telegram_webhooks Bot1WebhooksController, :robo1bot
  telegram_webhooks Bot2WebhooksController, :robo6bot
end
