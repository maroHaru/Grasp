class Worker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :to_dos, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com',
                       name: 'ゲスト') do |worker|
      worker.password = SecureRandom.urlsafe_base64
    end
  end

end
