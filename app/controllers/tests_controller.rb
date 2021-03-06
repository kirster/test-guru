class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: :start

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)

    @test.questions_amount

    if @test.timer
      session["passage_#{current_user.test_passage(@test).id}"] = @test.timer.minutes.from_now
    end
    
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end