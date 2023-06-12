class CreateWorkerEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_educations do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :education, null: false, foreign_key: true

      t.timestamps
    end
  end
end
