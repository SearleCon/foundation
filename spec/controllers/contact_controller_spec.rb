require 'spec_helper'

describe ContactController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

end
