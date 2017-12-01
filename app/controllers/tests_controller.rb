class TestsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find_test, except: [:index, :new, :create]
  before_action :set_user, only: :start 

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_test_not_found

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new    
  end

  def show; end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to :root
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def rescue_from_test_not_found
    render plain: 'Test not found'
  end

end