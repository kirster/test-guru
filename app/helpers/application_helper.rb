module ApplicationHelper

  def current_year
    Date.current.year
  end

  def github_url(username, repo)
    link_to "https://github.com/#{username}/#{repo}", target: "_blank" do
      yield
    end
  end

  def flash_message
    flash.map do |type, message|
      content_tag :p, message, class: type
    end.join.html_safe
  end
  
end