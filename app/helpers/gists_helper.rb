module GistsHelper

  def question_link(gist_question)
    link_to "#{link_body(gist_question)}", admin_question_path(gist_question)
  end

  def gist_hash_link(gist_url)
    link_to 'Gist Hash', gist_url
  end

  def link_body(gist_question)
    gist_question.body[0..25]
  end

end
