# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe WelcomeController, :type => :controller do
  include Devise::TestHelpers

  before do
    sign_in User.new
  end

  context "get index" do
    before { get :index }
    subject { response }
    it { should be_success }
  end
end
