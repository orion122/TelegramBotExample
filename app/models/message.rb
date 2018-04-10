class Message < ApplicationRecord
  validates_presence_of :chat_id, :message
  belongs_to :chat
  after_create_commit { MessageBroadcastJob.perform_later self }
end
