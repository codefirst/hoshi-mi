# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe Graph do
  before do
    @graph = Graph.new(:service => "graph-test", :section => "foo", :name => "bar")
    @user = User.new
    @user.id = 1
    @graph.created_by = @user
    @other = User.new
    @other.id = 2
    @graph.save!
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


  describe "logs" do
    before do
      @time = Time.now.utc.beginning_of_month
      [
        [ @time, 1 ],
        [ @time + 1.minute, 2],
        [ @time + 1.hour, 3],
        [ @time + 1.day, 4],
        [ @time + 1.month, 5]
      ].each do|happened_at, number|
        log = Log.new(:happened_at => happened_at, :number => number)
        log.graph = @graph
        log.save!
      end
    end

    context "hour" do
      subject { @graph.logs_by HoshiMi::Resolution.hour }
      it { should have(4).items }
      its(:first) { should  == [@time, 1.5] }
    end

    context "day" do
      subject { @graph.logs_by HoshiMi::Resolution.day }
      it { should have(3).items }
      its(:first) { should  == [@time, 2] }
    end

    context "month" do
      subject { @graph.logs_by HoshiMi::Resolution.month }
      it { should have(2).items }
      its(:first) { should  == [@time, 2.5] }
    end
  end

  describe "color" do
    context "blank" do
      subject { @graph.color }
      it { should == "#0b62a4" }
    end

    context "invalid color" do
      it { expect {
        @graph.color = "x"
        @graph.save! }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
