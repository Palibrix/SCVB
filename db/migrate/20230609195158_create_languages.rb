class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :level

      t.timestamps
    end
  end
end
