module ApplicationHelper
  def user_link(user)
    return '' if user.nil?
    link_to image_tag(user.icon_url, {:class => "profile"}) + ' ' + user.name, "https://twitter.com/#{user.name}", {:target => :blank}
  end
end
