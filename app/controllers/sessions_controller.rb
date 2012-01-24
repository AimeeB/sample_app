class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email],params[:session][:password])                                          
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      session[:current_user_id] = user.id
      sign_in user
      redirect_back_or user
    end
  end
  
  def destroy
    @current_user = session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out"
    sign_out
    redirect_to root_path
    reset_session
  end

end
