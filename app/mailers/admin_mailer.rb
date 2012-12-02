class AdminMailer < ActionMailer::Base
  default from: "support@searleconsulting.co.za" # Change to your app name here

  def welcome(user)
    @user = user
    mail from: 'support@searleconsulting.co.za', to: @user.email, subject: "Welcome"
  end

  def enquiry(message)
    @message = message
    mail to: message.receiver, subject: message.subject
  end
  handle_asynchronously :enquiry
end
