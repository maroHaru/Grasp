class Notification < ApplicationRecord
  belongs_to :visiter, class_name: 'Admin', foreign_key: 'visiter_id'
  belongs_to :visited, class_name: 'Admin', foreign_key: 'visited_id'
  belongs_to :visiter, class_name: 'Worker', foreign_key: 'visiter_id'
  belongs_to :visited, class_name: 'Worker', foreign_key: 'visited_id'
  belongs_to :notifiable, polymorphic: true
end
