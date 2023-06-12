class CreateWorkerLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_languages do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
