class BadgesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_badges

  def index; end

  private

  def find_badges
    @badges = Badge.all
  end

end
