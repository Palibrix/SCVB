class AddUrlToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :URL, :string
  end
end
