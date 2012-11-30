class SuggestionsController < ApplicationController
  respond_to :html

  before_filter :new_resource, :only => [:new, :create]

  def new
    respond_with(@suggestion)
  end

  def create
    flash[:notice] = 'Thank you for your suggestion' if @suggestion.save
    respond_with(@suggestion, :location => root_url)
  end

  private
  def new_resource
    @suggestion = Suggestion.new(params[:suggestion])
  end
end
