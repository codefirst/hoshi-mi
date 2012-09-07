# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Graph do
  before do
    @graph = Graph.new
    @user = User.new
    @graph.created_by = @user
  end
  subject { @graph.owner?(@user) }
  it { should == true }
end
