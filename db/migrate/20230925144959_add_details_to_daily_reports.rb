class AddDetailsToDailyReports < ActiveRecord::Migration[6.1]
  def change
    add_column :daily_reports, :is_reported, :boolean, default: false, null: false
    add_column :daily_reports, :reported_date, :date
  end
end
