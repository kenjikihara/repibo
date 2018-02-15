class RenameContentMainToBook < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :content_main, :content
  end
end
