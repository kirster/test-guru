class FeedbackMailer < ApplicationMailer

  before_action :find_admin

  def user_message(feedback_message)
    @body = feedback_message.body
    @user_name = feedback_message.user.full_name

    mail to: @admin.email
  end

  private

  def find_admin
    @admin = User.where(type: 'Admin').first    
  end

end
