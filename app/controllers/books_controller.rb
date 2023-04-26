class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new, :show]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    # @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'You have updated book successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
