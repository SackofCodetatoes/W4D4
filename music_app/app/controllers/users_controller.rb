class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #login user after signing in
    @user = User.new
    #do login logic
    redirect_to :show
  end
end
