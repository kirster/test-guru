class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: [:show, :update, :result, :gist]
  before_action :check_timer, only: :update

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.success!(helpers.ratio(@test_passage), current_user)
      
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question

    service = GistQuestionService.new(question)
    response = service.call

    flash_options = if service.successful_response?

      current_user.gists.create!(gist_url: response[:url], question: question)

      { notice: t('.success', link: response[:html_url]) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private
  
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])    
  end

  def check_timer
    if @test_passage.test.timer && @test_passage.stale?(session["passage_#{@test_passage.id}"])
      redirect_to result_test_passage_path(@test_passage)
    end
  end

end
