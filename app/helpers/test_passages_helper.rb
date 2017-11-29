module TestPassagesHelper
  def result_output(test_passage)
    ratio = 100 * (test_passage.correct_questions.to_f / 
                  test_passage.test.questions.count).round

    if ratio >= 85
      content_tag(:h2, content_tag(:span, "#{ratio}% ", 
                  id: 'success') + 'Test successfully passed!')
    else
      content_tag(:h2, content_tag(:span, "#{ratio}% ", 
                  id: 'fail') + 'Test failed!')
    end
  end

  def question_index(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

end
