class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
