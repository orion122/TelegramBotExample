require 'rails_helper'

RSpec.describe Chat, type: :model do
  context "validation tests" do
    it "ensures chat_id is present" do
      chat = Chat.new(chat_id: "123456")
      expect(chat.valid?).to eq(false)
    end

    it "ensures first_name is present" do
      chat = Chat.new(first_name: "Pavel")
      expect(chat.valid?).to eq(false)
    end

    it "should be able to save chat" do
      chat = Chat.new(
          chat_id: "123456",
          first_name: "Pavel"
          )
      expect(chat.save).to eq(true)
    end
  end
end
