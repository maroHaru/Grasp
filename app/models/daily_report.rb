class DailyReport < ApplicationRecord
  has_many :timecards, dependent: :destroy
  belongs_to :daily_report
end
