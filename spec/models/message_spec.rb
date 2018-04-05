require 'rails_helper'

RSpec.describe Message, type: :model do
  context "validation tests" do
    it "ensures chat_id is present" do
      message = Message.new(chat_id: "123456")
      expect(message.valid?).to eq(false)
    end


    it "ensures message is present" do
      message = Message.new(message: "some message")
      expect(message.valid?).to eq(false)
    end


    it "ensures incoming is true by default" do
      message = Message.new(
          chat_id: "123456",
          message: "some message"
      )
      expect(message.incoming?).to eq(true)
    end


    it "should be able to save message" do
      chat = Chat.create(
          chat_id: "123456",
          first_name: "Pavel"
      )

      message = chat.messages.create(
          incoming: false,
          message: "some message"
      )
      expect(message.save).to eq(true)
    end
  end
end
