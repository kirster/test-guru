class Users::SessionsController < Devise::SessionsController
  
  def create
    super do |resource|
      flash[:notice] = t('.notice', full_name: current_user.full_name)
    end
  end

end
