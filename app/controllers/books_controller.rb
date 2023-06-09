class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book
      flash[:notice] = ":You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to '/books'
    end
  end

  def update
    @book = Book.find(params[:id])
    @book_id = current_user.id
    if @book.update(book_params)
      redirect_to @book
      flash[:notice] = ":You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
      redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
