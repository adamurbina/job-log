class User < ApplicationRecord
  has_secure_password
  has_many :jobs
  has_many :clients, through: :jobs

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :title, presence: true
  validates :split, presence: true
  validates :split, numericality: {greater_than: 0}
  validates :split, numericality: {less_than: 1}

  def split_string
    (self.split * 100).to_s + "%"
  end

  def user_jobs
    @jobs ||= Job.where("user_id = ?", self.id)
  end

  def user_clients
    
  end

end
