class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end

    # @user = User.new
    # @user.name = params[:user][:name]
    # @user.password = params[:user][:password]
    # if @user.save
    #   session[:user_id] = @user.id
    #   redirect_to root_path
    # else
    #   render 'users/new'
    # end
  end


  private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
