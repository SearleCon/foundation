class UserObserver < ActiveRecord::Observer
  #This is the observer file, it watches for the callbacks around active record operations

  #This method will fire after an user is created for the first time, after_save fires every time a save happens
  def after_create(user)
    free_trial_subscription = create_free_trial
    user.subscriptions << free_trial_subscription
    AdminMailer.welcome(user)
  end


  private
  def create_free_trial
    plan = Plan.find_by_is_free(true)
    subscription = plan.subscriptions.build
    subscription.active = true
    subscription.save!
    subscription
  end
end
