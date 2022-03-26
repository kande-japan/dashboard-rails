class AddForeignkeyConstrations < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :contents, :slack_users
    add_foreign_key :content_categories, :slack_users
  end
end
