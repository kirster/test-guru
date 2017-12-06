class Users::SessionsController < Devise::SessionsController
  
  def create
    super do |resource|
      flash[:notice] = "Hello, #{current_user.full_name}"
    end
  end

end
