# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe GraphsController do
  include Devise::TestHelpers
  before do
    sign_in User.new
    @graph = Graph.new(:service => 'service1', :section => 'section1', :name => 'name1', :color => '#0000ff', :secret => 'secret1')
    @graph.save
  end

  context "get index" do
    before { get :index }
    subject { response }
    it { should be_success } 
    it { assigns[:graphs].should_not be_nil }
  end

  context "get new" do
    before { get :new }
    subject { response }
    it { should be_success } 
  end

  context "get create" do
    before { @graph.id = nil }
    it {
      lambda {
        post :create, :graph => @graph.attributes
      }.should change(Graph, :count)
    }
  end

  context "get show" do
    before { get :show, :id => @graph.to_param }
    subject { response }
    it { should be_success }
  end

  context "get edit" do
    before { get :edit, :id => @graph.to_param }
    subject { response }
    it { should be_success }
  end

  context "put update" do
    before { put :edit, :id => @graph.to_param }
    subject { response }
    it { should be_success }
  end

  context "delete destroy" do
    it {
      lambda {
        delete :destroy, :id => @graph.to_param
      }.should change(Graph, :count).by(-1)
    }
  end
end

