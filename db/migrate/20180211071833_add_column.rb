class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :transfer_complete, :boolean, default: false, null: false
  end
end
