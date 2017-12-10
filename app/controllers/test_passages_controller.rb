class TestPassagesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question

    response = GistQuestionService.new(question).call

    flash_options = if response

      create_gist(question, response[:url])

      notice_message = "#{view_context.link_to(t('.success'), 
                            response[:html_url], target: "_blank") }" 
      { notice: notice_message }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private
  
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])    
  end
  
  def create_gist(question, url)
    current_user.questions.push(question)
    gist = current_user.gists.last
    gist.gist_url = url
    gist.save
  end

end

