require 'rails_helper'

describe ServiceController, :type => :controller  do
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

  context "get index" do
    before { get :index }
    subject { response }
    it { should be_success }
    it { expect(assigns[:graphs]).to_not be_nil }
  end

  context "get by service" do
    before { get :service, :service => @graph.service }
    subject { response }
    it { should be_success }
    it { expect(assigns[:graphs]).to be_include(@graph) }
  end

  context "get by service" do
    before { get :section, :service => @graph.service, :section => @graph.section }
    subject { response }
    it { should be_success }
    it { expect(assigns[:graphs]).to be_include(@graph) }
  end

end
