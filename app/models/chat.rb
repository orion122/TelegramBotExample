class Chat < ApplicationRecord
  validates_presence_of :chat_id, :first_name
  has_many :messages
  scope :last_bot, ->(chat_id) { where(chat_id: chat_id).first.messages.where(incoming: true).last.bot }
end
