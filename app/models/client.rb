class Client < ApplicationRecord
  has_many :timecards, dependent: :destroy
  validates :name, presence: true
end
