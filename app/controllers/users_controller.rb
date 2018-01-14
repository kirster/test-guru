class UsersController < ApplicationController

  before_action :authenticate_user!

  def badges
    @badges = current_user.badges
  end

end
