require 'rails_helper'

RSpec.describe ChatsController, type: :controller do

  describe "GET #index" do
    it "returns index template" do
      get :index
      expect(response).to render_template("index")
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
  end


  describe "GET root_url" do
    it "returns chats#index" do
      expect(get: root_url).to route_to("chats#index")
    end
  end

end
