class CreateDailyReports < ActiveRecord::Migration[6.1]
  def change
    create_table :daily_reports do |t|
      t.integer :worker_id, null: false
      t.timestamps
    end
  end
end
