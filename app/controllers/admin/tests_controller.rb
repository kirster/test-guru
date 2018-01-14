class Admin::TestsController < Admin::BaseController
  
  before_action :set_tests, only: [:index, :update_inline]
  before_action :find_test, except: [:index, :new, :create]

  def index; end

  def new
    @test = Test.new    
  end

  def show; end

  def create
    @test = Test.new(test_params)

    @test.author = current_user

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :timer)
  end

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

end