class SubscriptionsController < ApplicationController
  skip_before_filter :subscription_required
   respond_to :html


  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    @plan = Plan.find(params[:plan_id])
    @subscription = @plan.subscriptions.build
    @subscription.user_id = current_user.id
    if params[:PayerID]
      @subscription.paypal_customer_token = params[:PayerID]
      @subscription.paypal_payment_token = params[:token]
    end
   respond_with(@plan, @subscription)
  end



  # POST /subscriptions
  # POST /subscriptions.json
  def create
    @subscription = Subscription.new(params[:subscription])
    @subscription.user_id = current_user.id
    @subscription.save_with_paypal_payment
    respond_with(@subscription, :location => root_url, :notice => 'Thank you for subscribing')
  end

end
