module ApplicationHelper
  def current_year
    Date.today.year
  end

  def github_url(author, repo)
    link_to author, repo, target: "_blank"
  end
end
