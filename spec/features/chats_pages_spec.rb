require 'rails_helper'

RSpec.feature "Visiting the chats page", type: :feature do
  scenario "The visitor should see a saved message of current chat" do
    chat = Chat.create(
        chat_id: "123456",
        first_name: "Pavel"
    )
    message = chat.messages.create(
        incoming: false,
        message: "some message"
    )
    visit "chats/#{chat.id}"
    expect(page).to have_text(message.message)
  end

  scenario "The visitor should see a chats list" do
    chat = Chat.create(
        chat_id: "123456",
        first_name: "Pavel"
    )
    visit "chats/#{chat.id}"
    expect(page).to have_text(chat.first_name)
  end
end
