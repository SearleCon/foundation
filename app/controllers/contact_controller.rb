class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      AdminMailer.enquiry(@message)
      redirect_to root_url, notice: 'Email was sent successfully'
    else
      render :new, alert: 'Please fill in all details'
    end
  end
end
