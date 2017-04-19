class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user.authenticate(params[:session][:password])
      redirect_to @user
    else
      redirect_to denied_path
    end
  end
end
