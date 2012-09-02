require "minitest_helper"

class GraphsControllerTest < MiniTest::Rails::ActionController::TestCase
  include Devise::TestHelpers

  def test_log
    sign_in User.new 
    post :log, :service => 'service', :section => 'section', :graph => 'graph', :secret => 'aaa', :number => 1
    assert_response :success
  end

end
