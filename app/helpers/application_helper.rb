module ApplicationHelper
  def user_link(user)
    return '' if user.nil?
    img = user.icon_url.blank? ? '' : image_tag(user.icon_url, {:class => "profile"}) + ' '
    link_to img + user.name, "https://twitter.com/#{user.name}", {:target => :blank}
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

  def service_link(service)
    link_to service, :action => :service, :service => service, :controller => :service
  end

  def section_link(service, section)
    link_to section, :action => :section, :service => service, :section => section, :controller => :service
  end

end
