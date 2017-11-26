class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, except: [:index, :create, :new]
  before_action :find_test_by_question, except: [:index, :create, :new]
 
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    test_redirect
  end

  def new
    @question = @test.questions.new
  end

  def show; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      test_redirect
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      test_redirect
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    test_redirect 
  end

  private

  def question_params 
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_test_by_question
    @test = @question.test
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def test_redirect
    redirect_to test_path(@test)
  end

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
