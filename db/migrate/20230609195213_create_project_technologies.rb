class CreateProjectTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :project_technologies do |t|
      t.references :project, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
