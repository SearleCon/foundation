class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  attr_accessible :expiry_date, :plan_id, :user_id, :active, :customer_paypal_id, :paypal_payment_token
  attr_accessor :paypal_payment_token

  def has_expired?
    self.expiry_date <= Date.today
  end

  def payment_provided?
    paypal_payment_token.present?
  end

end


# == Schema Information
#
# Table name: subscriptions
#
#  id                 :integer         not null, primary key
#  plan_id            :integer
#  user_id            :integer
#  active             :boolean         default(FALSE)
#  expiry_date        :date
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  customer_paypal_id :string(255)
#

