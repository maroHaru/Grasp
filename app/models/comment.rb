class Comment < ApplicationRecord
  belongs_to :admin
  belongs_to :daily_report

end
