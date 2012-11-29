class PaymentNotification < ActiveRecord::Base
  serialize :params

  attr_accessible :params, :status, :transaction_id, :user_id
end
