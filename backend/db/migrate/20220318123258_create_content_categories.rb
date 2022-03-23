class CreateContentCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :content_categories do |t|
      t.references :content, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
