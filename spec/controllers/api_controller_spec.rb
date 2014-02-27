# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe ApiController do
  include Devise::TestHelpers
  before do
    sign_in User.new
    Graph.where(:service => 'service', :section => 'section', :name => 'graph').delete_all
    @graph = Graph.new(:service => 'service', :section => 'section', :name => 'graph', :secret => 'aaa')
    @graph.logs.delete_all
    @graph.save!
    @time  = Time.now.beginning_of_month
  end

  context "post log" do
    it { expect {
      post_log 1, @time
    }.to change(@graph.logs, :count).by(1) }

    describe "response" do
      subject { response }
      it { should be_success }
    end
  end

  describe "resolution" do
    context "hour" do
      it { expect {
        hoshi_mi_resolution('hour') {
          post_log 1, @time
          post_log 1, @time + 30.minutes
          post_log 1, @time + 1.hour
        }
      }.to change(@graph.logs, :count).by(2) }
    end

    context "day" do
      it { expect {
        hoshi_mi_resolution('day') {
          post_log 1, @time
          post_log 1, @time + 1.hour
          post_log 1, @time + 1.day
        }
      }.to change(@graph.logs, :count).by(2) }
    end

    context "month" do
      it { expect {
        hoshi_mi_resolution('month') {
          post_log 1, @time
          post_log 1, @time + 1.day
          post_log 1, @time + 1.month
        }
      }.to change(@graph.logs, :count).by(2) }
    end
  end

  def post_log(value, time)
      post :log, {
        :service => 'service',
        :section => 'section',
        :graph => 'graph',
        :secret => @graph.secret,
        :time => time,
        :number => value
      }
  end

  context "error" do
    shared_examples_for "not found" do
      subject { response }
      it { should be_missing }
    end

   describe "not exist graph" do
      before do
        post :log, :service => 'not_exist_service', :section => 'section', :graph => 'graph', :secret => 'aaa', :number => 1
      end

      it_behaves_like "not found"
    end

   describe "unauth graph" do
      before do
        post :log, :service => 'service', :section => 'section', :graph => 'graph', :secret => 'aaa', :number => 1
      end

      it_behaves_like "not found"
    end
  end

  describe "ttl" do
    before do
      @graph.ttl = 3
      @graph.logs.delete_all
      @graph.save!

      4.times {|i|
        post_log i, @time + i.day
      }

      # discard AR model cache(?)
      @graph = Graph.find @graph.id
    end

    subject { @graph.logs }
    its(:count) { should == 3 }

    describe 'first element' do
      subject { @graph.logs.first }
      its(:number) { should == 1 }
    end

    describe 'last element' do
      subject { @graph.logs[-1] }
      its(:number) { should == 3 }
    end
  end
end
