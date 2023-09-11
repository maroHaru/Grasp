class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.integer :worker_id, null: false
      t.string :description, null: false
      t.timestamps
    end
  end
end
