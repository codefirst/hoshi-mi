require "minitest_helper"

class ApiControllerTest < MiniTest::Rails::ActionController::TestCase
  include Devise::TestHelpers

  before do
    sign_in User.new
  end

  def test_log
    post :log, :service => 'service', :section => 'section', :graph => 'graph', :secret => 'aaa', :number => 1
    assert_response :success
  end

end
