class SubscriptionsController < ApplicationController
  respond_to :html
  skip_before_filter :subscription_required
  before_filter :get_parent_resource, :only => [:new, :create]
  before_filter :new_resource, :only => [:new,:create]



  # GET /subscriptions/new
  # GET /subscriptions/new.json
  def new
    if params[:PayerID]
      @subscription.customer_paypal_id = params[:PayerID]
      @subscription.paypal_payment_token = params[:token]
    end
   respond_with(@plan, @subscription)
  end

  # POST /subscriptions
  # POST /subscriptions.json
  def create
    if @subscription.save_with_paypal_payment
      current_user.subscriptions << @subscription
      flash[:notice] = 'Thank you for your payment, your subscription has been activated.'
    end

    respond_with(:location => root_url)
  end


  private
  def get_parent_resource
    @plan = Plan.find(params[:plan_id]) if params[:plan_id]
  end

  def new_resource
     @subscription = @plan.subscriptions.new(params[:subscription])
  end

end
