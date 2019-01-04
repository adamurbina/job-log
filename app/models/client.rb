class Client < ApplicationRecord
  has_many :jobs
  has_many :users, through: :jobs

  validates :company, presence: true
  validates :company, uniqueness: true
  validates :contact, presence: true
end
