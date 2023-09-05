class AddColumnsToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :chatroom_id, :bigint
    add_column :chatrooms, :user_id, :bigint

    add_foreign_key :chatrooms, :chatrooms, column: :chatroom_id
    add_foreign_key :chatrooms, :users
  end
end
