class DailyReport < ApplicationRecord
  has_many :timecards, dependent: :destroy
end
