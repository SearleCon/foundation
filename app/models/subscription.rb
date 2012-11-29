class Subscription < ActiveRecord::Base
  attr_accessible :expiry_date, :plan_id, :user_id, :active
  belongs_to :user
  belongs_to :plan

end
