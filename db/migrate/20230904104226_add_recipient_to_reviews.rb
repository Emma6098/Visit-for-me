class AddRecipientToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :recipient, null: true, foreign_key: { to_table: :users }
  end
end
