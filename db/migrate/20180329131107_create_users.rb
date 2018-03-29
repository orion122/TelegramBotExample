class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :chat_id
      t.string :first_name

      t.timestamps
    end
    add_index :users, :chat_id, unique: true
  end
end
