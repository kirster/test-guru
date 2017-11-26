module QuestionsHelper
  def question_header(test)
    if params[:action] == 'new'
      "Create new #{test.title} question"
    else
      "Edit #{test.title} question"
    end
  end

  def url_model(test, question)
    params[:action] == 'new' ? [test, question] : question
  end
end