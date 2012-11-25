# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../spec_helper'

describe GraphsController do
  include Devise::TestHelpers
  before do
    @owner = User.new
    @owner.id = 1
    @user = User.new
    @user.id = 2
    sign_in @user
    @graph = Graph.new(:service => 'service1', :section => 'section1', :name => 'name1', :color => '#0000ff', :secret => 'secret1')
    @graph.created_by = @owner
    @graph.save
  end

  context "cannot get secret keys of other's graphs in get index" do
    before { get :index, :format => 'json' }
    subject { JSON.parse(response.body)[-1] }
    it { should_not have_key('secret') }
  end

  context "can get secret keys of my graphs in get index" do
    before {
      sign_in @owner
      get :index, :format => 'json'
    }
    subject { JSON.parse(response.body)[-1] }
    it { should have_key('secret') }
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

  context "cannot get secret keys of other's graphs in get index" do
    before { get :show, :id => @graph.to_param, :format => 'json' }
    subject { JSON.parse(response.body) }
    it { should_not have_key('secret') }
  end

  context "can get secret keys of my graphs in get index" do
    before {
      sign_in @owner
      get :show, :id => @graph.to_param, :format => 'json'
    }
    subject { JSON.parse(response.body) }
    it { should have_key('secret') }
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

