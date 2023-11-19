class Notification < ApplicationRecord

  enum action: { comment: 0, checked_item: 1 }
end
