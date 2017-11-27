module QuestionsHelper
  def question_header(test)
    if test.questions.last.new_record?
      "Create new #{test.title} question"
    else
      "Edit #{test.title} question"
    end
  end
end