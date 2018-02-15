class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :content_main
      t.text :content_sub
      t.text :image_main
      t.text :image_sub_a
      t.text :image_sub_b

      t.timestamps
    end
  end
end
