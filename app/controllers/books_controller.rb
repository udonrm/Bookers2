class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:index, :new]

  def new
    @book = Book.new
  end

  def index
    @user = current_user
  end

end
