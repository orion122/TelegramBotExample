require 'rails_helper'

RSpec.describe ChatsController, type: :controller do

  describe "GET #index" do
    it "returns success response" do
      get :index
      expect(response).to be_success
    end

    it "returns index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @chats" do
      chat = Chat.create(chat_id: "123456", first_name: "Pavel")
      get :index
      expect(assigns(:chats)).to eq([chat])
    end
  end


  describe "GET #show" do
    let(:chat) { Chat.create(chat_id: "123456", first_name: "Pavel") }

    it "returns success response" do
      get :show, params: { id: chat }
      expect(response).to be_success
    end

    it "render show template" do
      get :show, params: { id: chat }
      expect(response).to render_template("show")
    end

    it "assigns the requested @chat as @current_chat" do
      get :show, params: { id: chat }
      expect(assigns(:current_chat)).to eq(chat)
    end
  end


  describe "GET root_url" do
    it "returns chats#index" do
      expect(get: root_url).to route_to("chats#index")
    end
  end

end
