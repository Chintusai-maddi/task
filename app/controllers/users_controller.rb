class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password))
    if @user.save
      flash[:notice] = 'user was created successfully.'
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def show
    @article = User.find(params[:id])
    @articles = @article.articles
  end
end
