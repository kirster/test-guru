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
    flash.each do |type, message|
      concat content_tag :p, flash[type], id: type, class: 'flash'
    end
    return
  end

end