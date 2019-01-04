class Job < ApplicationRecord
  belongs_to :user
  belongs_to :client

  def fee_string
    "$" + self.fee.to_s.insert(-4, ",")
  end

  def appraiser_fee
    "$" + (self.fee * self.user.split).to_i.to_s.insert(-4, ",")
  end

  def self.make_job(params)
    job = Job.new
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
    job.job_number = Time.now.year.to_s + "-" + job.id.to_s
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
