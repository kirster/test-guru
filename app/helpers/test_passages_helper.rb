module TestPassagesHelper
  def result_output(test_passage)

    ratio = ratio(test_passage)

    if ratio >= 85
      content_tag :h2 do
        concat content_tag :span, "#{ratio}% ", class: 'success'
        concat 'Test successfully passed!'
      end
    else
      content_tag :h2 do
        concat content_tag :span, "#{ratio}% ", class: 'fail'
        concat 'Test failed!'
      end
    end
  end

  def passing_question_number(test_passage)
    content_tag(:b, "(#{current_question(test_passage)} / #{questions_amount(test_passage)})")
  end

  def questions_amount(test_passage)
    test_id = "test_#{test_passage.test.id}"
    session[test_id.to_sym] ||= test_passage.test.questions.count
  end

  def current_question(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def ratio(test_passage)
    100 * (test_passage.correct_questions.to_f / test_passage.test.questions.count)
  end

  def passage_end_time(test_passage)
    passage_id = "passage_#{test_passage.id}"
    session[passage_id.to_sym] ||= Time.now + test_passage.test.timer.minutes
  end

end
