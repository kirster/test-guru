module GistsHelper

  def question_link(gist)
    question = Question.find(gist.question_id)
    
    link_to "#{truncate(question.body, length: 25)}", admin_question_path(question)
  end

  def gist_hash_link(gist)
    link_to 'Gist Hash', gist.gist_url
  end

end
