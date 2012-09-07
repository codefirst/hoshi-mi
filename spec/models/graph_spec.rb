# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Graph do
  before do
    @graph = Graph.new
    @user = User.new
    @user.id = 1
    @graph.created_by = @user
    @other = User.new
    @other.id = 2
  end
  context "my graph" do
    subject { @graph.owner?(@user) }
    it { should == true }
  end

  context "other's graph" do
    subject { @graph.owner?(@other) }
    it { should == false }
  end

  context "nil owner" do
    subject { @graph.owner?(nil) }
    it { should == false }
  end

  context "user not seved" do
    subject { @graph.owner?(User.new) }
    it { should == false }
  end
end
