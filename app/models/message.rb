class Message < ApplicationRecord
  validates_presence_of :chat_id, :message
  belongs_to :chat
end
