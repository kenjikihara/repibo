class RemoveContentSubToBook < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :content_sub, :text
    remove_column :books, :image_sub_a, :text
    remove_column :books, :image_sub_b, :text
  end
end
