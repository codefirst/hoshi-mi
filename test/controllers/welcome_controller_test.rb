require "minitest_helper"

class WelcomeControllerTest < MiniTest::Rails::ActionController::TestCase
  include Devise::TestHelpers
  test "should get index" do
    sign_in User.new
    get :index
    assert_response :success
  end

end
