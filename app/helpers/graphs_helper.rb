module GraphsHelper
  def is_own?(graph)
    graph.created_by == current_user
  end
end
