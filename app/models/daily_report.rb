class DailyReport < ApplicationRecord
  has_many :timecards, dependent: :destroy
  has_many :comments, dependent: :destroy
  # belongs_to :daily_report
  belongs_to :worker
end
