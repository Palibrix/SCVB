class CreateWorkerProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_projects do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
