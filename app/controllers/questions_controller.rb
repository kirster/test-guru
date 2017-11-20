class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :show]
 
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    render plain: @test.questions.inspect
  end

  def new
    
  end

  def show
    question = @test.questions.find(params[:id])
    render plain: question.inspect
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy    
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
