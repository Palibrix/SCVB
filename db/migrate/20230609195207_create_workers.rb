class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :surname
      t.string :occupation
      t.string :phone
      t.string :email
      t.string :address
      t.text :about

      t.timestamps
    end
  end
end
