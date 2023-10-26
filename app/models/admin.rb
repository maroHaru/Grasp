class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :visiter, class_name: 'Notification', foreign_key: 'visiter_id'
  has_many :visited, class_name: 'Notification', foreign_key: 'visited_id'
  has_many :notifications, as: :notifiable
end
