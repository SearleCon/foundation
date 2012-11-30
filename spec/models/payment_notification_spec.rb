require 'spec_helper'

describe PaymentNotification do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: payment_notifications
#
#  id             :integer         not null, primary key
#  params         :text
#  user_id        :integer
#  transaction_id :integer
#  status         :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

