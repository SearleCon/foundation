class PlansController < ApplicationController
  respond_to :html

  skip_before_filter :subscription_required

  # GET /plans
  # GET /plans.json
  def index
    respond_with(@plans = Plan.all)
  end

  def paypal_check_out
    plan = Plan.find(params[:id])
    subscription = plan.subscriptions.new
    subscription.user_id = current_user.id
    redirect_to subscription.paypal.checkout_url(
                    return_url: new_subscription_url(:plan_id => plan.id),
                    cancel_url: root_url, ipn_url: payment_notifications_url)
  end
end

