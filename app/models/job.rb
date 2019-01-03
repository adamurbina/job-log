class Job < ApplicationRecord
  belongs_to :user
  belongs_to :client

  def fee_string
    "$" + self.fee.to_s.insert(-4, ",")
  end

  def appraiser_fee
    "$" + (self.fee * self.user.split).to_i.to_s.insert(-4, ",")
  end

end
