class AddNameToContents < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :name, :string
  end
end
