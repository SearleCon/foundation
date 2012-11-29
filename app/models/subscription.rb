class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :plan

  attr_accessible :expiry_date, :plan_id, :user_id, :active, :customer_paypal_id
  attr_accessor :paypal_payment_token

  before_create :calculate_expiry_date

  def has_expired?
    self.expiry_date <= Date.today
  end

  def save_with_paypal_payment
    response = paypal.request_payment
    response.approved? && response.success? ? save : false
  end

  def payment_provided?
    paypal_payment_token.present?
  end

  def paypal
    PaypalPayment.new(self)
  end

  private
  def calculate_expiry_date
    self.expiry_date = Time.now + self.plan.duration.months
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
#  customer_paypal_id :integer
#

