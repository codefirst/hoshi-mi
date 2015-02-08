require 'rails_helper'

describe ComplexGraphsController, :type => :controller do
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

 def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ComplexGraphsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all complex_graphs as @complex_graphs" do
      complex_graph = ComplexGraph.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:complex_graphs)).to eq([complex_graph])
    end
  end

  describe "GET show" do
    it "assigns the requested complex_graph as @complex_graph" do
      complex_graph = ComplexGraph.create! valid_attributes
      get :show, {:id => complex_graph.to_param}, valid_session
      expect(assigns(:complex_graph)).to eq(complex_graph)
    end
  end

  describe "GET new" do
    it "assigns a new complex_graph as @complex_graph" do
      get :new, {}, valid_session
      expect(assigns(:complex_graph)).to be_a_new(ComplexGraph)
    end
  end

  describe "GET edit" do
    it "assigns the requested complex_graph as @complex_graph" do
      complex_graph = ComplexGraph.create! valid_attributes
      get :edit, {:id => complex_graph.to_param}, valid_session
      expect(assigns(:complex_graph)).to eq(complex_graph)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ComplexGraph" do
        expect {
          post :create, {:complex_graph => valid_attributes}, valid_session
        }.to change(ComplexGraph, :count).by(1)
      end

      it "assigns a newly created complex_graph as @complex_graph" do
        post :create, {:complex_graph => valid_attributes}, valid_session
        expect(assigns(:complex_graph)).to be_a(ComplexGraph)
        expect(assigns(:complex_graph)).to be_persisted
      end

      it "redirects to the created complex_graph" do
        post :create, {:complex_graph => valid_attributes}, valid_session
        expect(response).to redirect_to(ComplexGraph.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved complex_graph as @complex_graph" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(ComplexGraph).to receive(:save).and_return(false)
        post :create, {:complex_graph => {}}, valid_session
        expect(assigns(:complex_graph)).to be_a_new(ComplexGraph)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(ComplexGraph).to receive(:save).and_return(false)
        post :create, {:complex_graph => {}}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested complex_graph" do
        complex_graph = ComplexGraph.create! valid_attributes
        # Assuming there are no other complex_graphs in the database, this
        # specifies that the ComplexGraph created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(ComplexGraph).to receive(:graphs=).with(Graph.all)
        put :update, {:id => complex_graph.to_param, :graph => Graph.all.map{|g|g.id}}, valid_session
      end

      it "assigns the requested complex_graph as @complex_graph" do
        complex_graph = ComplexGraph.create! valid_attributes
        put :update, {:id => complex_graph.to_param, :complex_graph => valid_attributes }, valid_session
        expect(assigns(:complex_graph)).to eq(complex_graph)
      end

      it "redirects to the complex_graph" do
        complex_graph = ComplexGraph.create! valid_attributes
        put :update, {:id => complex_graph.to_param, :complex_graph => valid_attributes}, valid_session
        expect(response).to redirect_to(complex_graph)
      end
    end

    describe "with invalid params" do
      it "assigns the complex_graph as @complex_graph" do
        complex_graph = ComplexGraph.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(ComplexGraph).to receive(:save).and_return(false)
        put :update, {:id => complex_graph.to_param, :complex_graph => {}}, valid_session
        expect(assigns(:complex_graph)).to eq(complex_graph)
      end

      it "re-renders the 'edit' template" do
        complex_graph = ComplexGraph.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(ComplexGraph).to receive(:save).and_return(false)
        put :update, {:id => complex_graph.to_param, :complex_graph => {}}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested complex_graph" do
      complex_graph = ComplexGraph.create! valid_attributes
      expect {
        delete :destroy, {:id => complex_graph.to_param}, valid_session
      }.to change(ComplexGraph, :count).by(-1)
    end
 end

end
