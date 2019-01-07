module JobsHelper

  def fee_string(job)
    "$" + job.fee.to_s.insert(-4, ",")
  end

  def appraiser_fee(job)
    "$" + (job.fee * job.user.split).to_i.to_s.insert(-4, ",")
  end

  def client_company(job)
    job.client.company
  end

end
