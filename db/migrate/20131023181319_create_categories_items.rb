class CreateCategoriesItems < ActiveRecord::Migration
  def change
    create_table :categories_items do |t|
      t.integer :category_id
      t.integer :item_id

      t.timestamps
    end
  end
end
