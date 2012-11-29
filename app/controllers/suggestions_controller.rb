class SuggestionsController < ApplicationController
  respond_to :html

  def new
    respond_with(@suggestion = Suggestion.new)
  end

  def create
    @suggestion = Suggestion.new(params[:suggestion])
    flash[:notice] = 'Thank you for your suggestion' if @suggestion.save
    respond_with(@suggestion, :location => root_url)
  end
end
