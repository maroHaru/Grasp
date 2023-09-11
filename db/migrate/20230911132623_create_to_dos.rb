class CreateToDos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_dos do |t|
      t.integer :worker_id, null: false
      t.string :name, null: false
      t.date :completed_date
      t.boolean :is_completed, default: false, null: false
      t.timestamps
    end
  end
end
