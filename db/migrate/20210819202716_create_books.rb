class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.float :list_price
      t.text :description
      t.integer :seller_id
      t.text :course_info

      t.timestamps
    end
  end
end
