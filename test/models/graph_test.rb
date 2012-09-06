require "minitest_helper"

class GraphTest < MiniTest::Rails::ActiveSupport::TestCase
  test "owner" do
    graph = Graph.new
    user = User.new
    graph.created_by = user
    assert graph.owner?(user)
  end
end
