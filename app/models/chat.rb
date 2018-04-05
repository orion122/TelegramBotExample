class Chat < ApplicationRecord
  validates_presence_of :chat_id, :first_name
  has_many :messages
end
