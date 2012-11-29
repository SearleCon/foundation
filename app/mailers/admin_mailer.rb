class AdminMailer < ActionMailer::Base
  default from: "support@searleconsulting.co.za" # Change to your app name here

  def welcome(user)
    @user = user
    mail to: @user.email, subject: "Welcome"
  end
  handle_asynchronously :welcome

  def enquiry(message)
    @message = message
    mail to: message.receiver, subject: message.subject
  end
  handle_asynchronously :enquiry
end
