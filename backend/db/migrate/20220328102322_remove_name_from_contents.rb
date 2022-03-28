class RemoveNameFromContents < ActiveRecord::Migration[7.0]
  def change
    remove_column :contents, :name
  end
end
