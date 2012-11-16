module GraphsHelper
  def active?(resolution)
    if resolution.to_s == @resolution.to_s
      "active"
    else
      ""
    end
  end

  def each_service(graphs, &block)
    graphs.group_by {|g| g.service }.sort_by {|service,_| service }.each(&block)
  end

  def each_section(graphs, &block)
    graphs.group_by {|g| g.section }.sort_by {|section,_| section }.each(&block)
  end

  def each_graph(graphs, &block)
    graphs.sort_by {|g| g.updated_at }.each(&block)
  end
end
