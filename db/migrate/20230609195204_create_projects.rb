class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :company
      t.string :term
      t.text :additions

      t.timestamps
    end
  end
end
