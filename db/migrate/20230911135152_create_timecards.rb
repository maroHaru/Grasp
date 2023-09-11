class CreateTimecards < ActiveRecord::Migration[6.1]
  def change
    create_table :timecards do |t|
      t.integer :daily_report_id, null: false
      t.integer :worker_id, null: false
      t.integer :client_id
      t.integer :job_id
      t.integer :to_do_id
      t.string :memo
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
