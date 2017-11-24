class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, except: [:index, :create, :new]
 
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    redirect_to controller: 'tests', action: 'show', id: "#{params[:test_id]}"
  end

  def new
    @question = Question.new
  end

  def show; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to test_question_path(@test, @question)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to test_question_path(@test, @question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@test, @question)   
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
