class PlansController < ApplicationController
  respond_to :html

  # GET /plans
  # GET /plans.json
  def index
    respond_with(@plans = Plan.all)
  end
end

