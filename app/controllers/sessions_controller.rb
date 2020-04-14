class SessionsController < ApplicationController
  def new
  end

  def create
    # @user = User.find_by(name: params[:user][:name])
    #     if @user && @user.authenticate(params[:user][:password])
    #         session[:user_id] = @user.id
    #         redirect_to user_path(@user)
    #     else
    #         redirect_to new_user_path
    #     end
    @user = User.find_by(:name => params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'sessions/new'
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
