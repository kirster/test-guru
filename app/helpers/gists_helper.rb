module GistsHelper

  def question_link(gist)  
    link_to "#{truncate(question.body, length: 25)}", admin_question_path(gist.question)
  end

  def gist_hash_link(gist)
    link_to 'Gist Hash', gist.gist_url
  end

end
