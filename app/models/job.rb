class Job < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :property_name, presence: true
  validates :property_type, presence: true
  validates :client_id, presence: true
  validates :fee, presence: true
  validates :fee, numericality: { greater_than: 100}

  def self.make_job(params, user)
    job = Job.new
    job.user_id = user.id
    job.property_name = params["property_name"]
    job.property_type = params["property_type"]
    job.fee = params["fee"]

    if params["client_company"].empty?
      params.permit!
      job.client_attributes(params["client_attributes"])
    else
      job.set_client_company(params["client_company"])
    end
    job.save
    job_number = job.id.to_s
    binding.pry
    job.job_number = Time.now.year.to_s + "-" + job_number
    job.save
    job
  end

  def client_attributes(client_attributes)
      client = Client.new(client_attributes)
      client.save
      self.client = client
  end

  def set_client_company(client_company)
    client = Client.find_by(id: client_company)
    self.client = client
  end

  def client_company
    self.client ? self.client.company : nil
  end

end
