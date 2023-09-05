class AddOtherUserIdToChatrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :chatrooms, :other_user_id, :bigint
  end
end
