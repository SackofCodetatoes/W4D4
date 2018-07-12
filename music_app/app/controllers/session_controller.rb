class SessionController < ApplicationController

  def new
    @user = User.new
    
  end

  def create
    #login logic
    #reset user's session token and session sesson token and redirect to show
  end

  def destroy
  end

end
