class RenameImageMainColumnToBooks < ActiveRecord::Migration[5.1]
  def change
    rename_column :books, :image_main, :image
  end
end
