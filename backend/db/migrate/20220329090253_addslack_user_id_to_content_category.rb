class AddslackUserIdToContentCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :content_categories, :slack_user_id, :string
  end
end
