class AddUserIdToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :book_id, :integer
  end
end
