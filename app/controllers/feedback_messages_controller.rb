class FeedbackMessagesController < ApplicationController

  before_action :authenticate_user!

  def new
    @feedback_message = FeedbackMessage.new
  end

  def create
    @feedback_message = current_user.feedback_messages.new(message_params)

    if @feedback_message.save
      FeedbackMailer.user_message(@feedback_message).deliver_now
      redirect_to :root, notice: 'Message was sent.Thanks for your feedback'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:feedback_message).permit(:body)
  end

end
