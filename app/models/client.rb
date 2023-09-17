class Client < ApplicationRecord
  has_many :timecards, dependent: :destroy
end
