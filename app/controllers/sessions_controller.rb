class SessionsController < ApplicationController
  def new
    logged_in_user
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user and @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
  
  private
  def logged_in_user
    redirect_back_or current_user unless !logged_in?
  end
end
