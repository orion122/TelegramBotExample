class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chats = Chat.all

    @current_chat = Chat.find(params[:id])

    @messages = @current_chat.messages
  end
end
