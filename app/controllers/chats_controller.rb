class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def show
    @chats = Chat.all

    @current_chat = Chat.where(id: params[:id]).first

    @messages = @current_chat.messages
  end
end
