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
      content_tag :div, message, class: "#{bootstrap_flash_class(type)}" 
    end.join.html_safe
  end

  def bootstrap_flash_class(type)
    case type
      when 'notice' then 'alert alert-info'
      when 'alert' then 'alert alert-danger'   
    end
  end

  def link_to_admin_panel(current_user)
    if current_user.admin?
      content_tag :span do
        concat link_to t('admin_panel'), admin_tests_path, class: "btn btn-primary" 
      end
    end
  end

end
