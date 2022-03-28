# frozen_string_literal: true

class RemoveUnnecessaryColumnOfContentCategory < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :content_categories, :slack_users

    change_table :content_categories do |t|
      t.remove :slack_user_id
    end

    change_column :content_categories, :user_id, :string
  end
end
