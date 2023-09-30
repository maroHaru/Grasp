class Timecard < ApplicationRecord
  belongs_to :daily_report
  belongs_to :worker
  belongs_to :client, optional: true
  belongs_to :job, optional: true
  belongs_to :to_do, optional: true

  def amount_of_time
    Time.at(end_time - start_time).utc.strftime('%R')
  end
end
