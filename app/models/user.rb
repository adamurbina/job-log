class User < ApplicationRecord
  has_secure_password
  has_many :jobs
  has_many :clients, through: :jobs

  validates :username, presence: true
  validates :username, uniqueness: true

  def split_string
    (self.split * 100).to_s + "%"
  end

end
