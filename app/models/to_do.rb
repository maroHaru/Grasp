class ToDo < ApplicationRecord
  has_many :timecards, dependent: :destroy
  belongs_to :worker
  validates :name, presence: true
end
