class RenameUserIdToChatIdInMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :user_id, :chat_id
  end
end
