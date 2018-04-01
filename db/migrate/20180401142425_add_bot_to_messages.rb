class AddBotToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :bot, :string
  end
end
