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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    if @user.update(params.require(:user).permit(:username,:email,:password))
      flash[:notice]='user updated'
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user=User.find(params[:id])
    @articles= Article.where(user_id:@user.id)
    @articles.each do |article|
      article.destroy
    end
    @user.destroy
    flash[:notice]='user is destroyed'
    redirect_to users_path
  end

  def show
    @article = User.find(params[:id])
    @articles = @article.articles
  end
end
