module TestPassagesHelper
  def result_output(test_passage)

    ratio = ratio(test_passage)

    if test_passage.completed?
      case ratio
      when 0..84
        content_tag :h2 do
          concat content_tag :span, "#{ratio}% ", class: 'fail'
          concat 'Test failed!'
        end
      else
        content_tag :h2 do
          concat content_tag :span, "#{ratio}% ", class: 'success'
          concat 'Test successfully passed!'
        end
      end
    else
      content_tag :h1, "Test failed. Your time is out", class: 'fail'
    end
  end

  def passing_question_number(test_passage)
    questions_amount = Rails.cache.read("test_#{test_passage.test.id}")
    content_tag(:b, "(#{current_question(test_passage)} / #{questions_amount})")
  end

  def current_question(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end

  def ratio(test_passage)
    100 * (test_passage.correct_questions.to_f / test_passage.test.questions.count)
  end

end
