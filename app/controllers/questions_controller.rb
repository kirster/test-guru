class QuestionsController < ApplicationController
  before_action :find_test, except: :new
  before_action :find_question, only: [:show, :destroy]
 
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    render plain: @test.questions.inspect
  end

  def new;end

  def show
    render plain: @question.inspect
  end

  def create
    @test.questions.create(question_params)
    render plain: @test.questions.last.inspect 
  end

  def destroy
    @question.destroy
    render plain: "Question with id #{params[:id]} was deleted"  
  end

  private

  def question_params 
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
