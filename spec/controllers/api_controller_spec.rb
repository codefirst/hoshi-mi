# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe ApiController do
  include Devise::TestHelpers
  before do
    sign_in User.new
  end

  context "post log" do
    before do
      post :log, :service => 'service', :section => 'section', :graph => 'graph', :secret => 'aaa', :number => 1
    end
    subject { response }
    it { should be_success }
  end
end
