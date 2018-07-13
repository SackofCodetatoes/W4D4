class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #login user after signing in
    @user = User.new(email: params[:user][:email], password: params[:user][:password])
    @user.save!
    log_in_user!(@user)
    redirect_to user_url(@user.id)
  end


  def show
    @user = User.find(params[:id])
    render :show
  end


  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
