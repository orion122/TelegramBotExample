require 'rails_helper'

RSpec.describe ChatsController, type: :controller do

  describe "GET #index" do
    it "returns success response" do
      get :index
      expect(response).to be_success
    end
  end


  describe "GET #show" do
    let(:chat) { Chat.create(chat_id: "123456", first_name: "Pavel") }
    it "returns success response" do
      get :show, params: { id: chat }
      expect(response).to be_success
    end
  end

end
