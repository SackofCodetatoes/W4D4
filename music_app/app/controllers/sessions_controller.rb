class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # debugger
    #login logic
    #reset user's session token and session sesson token and redirect to show
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    #check user
    log_in_user!(user)
    redirect_to user_url(user.id)
  end

  def destroy
    logout
    redirect_to new_user_url
  end


end
