class Plan < ActiveRecord::Base
  has_many :subscriptions

  default_scope where(:active => true)

  attr_accessible :active, :duration, :is_free, :name, :price
end
