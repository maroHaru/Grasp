class DailyReport < ApplicationRecord
  has_many :timecards, dependent: :destroy
  # belongs_to :daily_report
  belongs_to :worker
end
