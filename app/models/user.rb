class User < ApplicationRecord
  has_secure_password
  has_many :jobs
  has_many :clients, through: :jobs

  validates :username, :presence => true, :message => "Username required"
  validates :username, :uniqueness => true, :message => "User already exists"

end
