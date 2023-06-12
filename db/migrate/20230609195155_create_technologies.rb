class CreateTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :version
      t.string :tool

      t.timestamps
    end
  end
end
