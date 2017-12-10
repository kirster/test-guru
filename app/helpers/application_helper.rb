module ApplicationHelper

  BOOTSTRAP_FLASH_CLASS = { 'notice' => 'alert alert-info', 'alert' => 'alert alert-danger' }

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
      content_tag :div, raw(message), class: "#{BOOTSTRAP_FLASH_CLASS[type]}" 
    end.join.html_safe
  end

end
