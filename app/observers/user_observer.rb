class UserObserver < ActiveRecord::Observer
  #This is the observer file, it watches for the callbacks around active record operations

  #This method will fire after an user is created for the first time, after_save fires every time a save happens
  def after_create(user)
    AdminMailer.welcome(user)
  end

end
