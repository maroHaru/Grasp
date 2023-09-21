class Job < ApplicationRecord
  has_many :timecards, dependent: :destroy
  belongs_to :worker
end
