require 'spec_helper'

describe ServiceController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'service'" do
    it "returns http success" do
      get 'service'
      response.should be_success
    end
  end

  describe "GET 'section'" do
    it "returns http success" do
      get 'section'
      response.should be_success
    end
  end

end
