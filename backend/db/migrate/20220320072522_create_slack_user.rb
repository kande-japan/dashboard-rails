# frozen_string_literal: true

class CreateSlackUser < ActiveRecord::Migration[7.0]
  def change
    create_table :slack_users, id: false do |t|
      t.string :id, primary_key: true, limit: 10
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :real_name

      t.string :user_id

      t.timestamps

      t.index :email
      t.index :user_id, unique: true
    end

    add_foreign_key :slack_users, :users
  end
end
