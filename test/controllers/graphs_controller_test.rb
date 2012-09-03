require "minitest_helper"

class GraphsControllerTest < MiniTest::Rails::ActionController::TestCase
  include Devise::TestHelpers

  before do
    sign_in User.new
    @graph = Graph.new(:service => 'service1', :section => 'section1', :name => 'name1', :color => '#0000ff', :secret => 'secret1')
    @graph.save
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:graphs)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    @graph.id = nil
    assert_difference('Graph.count') do
      post :create, :graph => @graph.attributes
    end

    assert_redirected_to graph_path(assigns(:graph))
  end

  def test_show
    get :show, :id => @graph.to_param
    assert_response :success
  end

  def test_edit
    get :edit, :id => @graph.to_param
    assert_response :success
  end

  def test_update
    put :update, :id => @graph.to_param, :graph => @graph.attributes
    assert_redirected_to graph_path(assigns(:graph))
  end

  def test_destroy
    assert_difference('Graph.count', -1) do
      delete :destroy, :id => @graph.to_param
    end

    assert_redirected_to graphs_path
  end
end
