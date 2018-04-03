class RenameTableUsersToChats < ActiveRecord::Migration[5.0]
  def change
    rename_table :users, :chats
  end
end
