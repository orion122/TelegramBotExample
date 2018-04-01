class ChangeSendToToBeIncomingBooleanInMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :send_to, :incoming
    change_column :messages, :incoming, :boolean, default: true
  end
end
