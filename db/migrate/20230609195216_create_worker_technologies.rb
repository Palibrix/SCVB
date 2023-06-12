class CreateWorkerTechnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_technologies do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
