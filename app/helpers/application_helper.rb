module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(username, repo, &block)
    link_to block.call, "https://github.com/#{username}/#{repo}", 
            target: "_blank"
  end
end
