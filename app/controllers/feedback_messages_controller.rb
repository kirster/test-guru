class FeedbackMessagesController < ApplicationController

  before_action :authenticate_user!

  def new
    @feedback_message = FeedbackMessage.new
  end

  def create
    @feedback_message = FeedbackMessage.new(message_params)

    if @feedback_message.save
      FeedbackMailer.user_message(@feedback_message).deliver_now
      redirect_to :root
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:feedback_message).permit(:body, :user_id)
  end

end
