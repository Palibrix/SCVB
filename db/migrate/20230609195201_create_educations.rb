class CreateEducations < ActiveRecord::Migration[7.0]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :term
      t.string :specialization

      t.timestamps
    end
  end
end
