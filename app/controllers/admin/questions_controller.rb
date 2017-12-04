class Admin::QuestionsController < Admin::BaseController
  
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, except: [:index, :create, :new] 
 
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    redirect_to admin_test_path(@test)
  end

  def new
    @question = @test.questions.new
  end

  def show; end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@question.test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test) 
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

  def rescue_from_question_not_found
    render plain: 'Question not found'
  end
end
