class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render "new"
    end

  end

  def edit
    find_book
  end

  def update
    find_book

    if @book.update(book_params)
      redirect_to @book
    else
      render "edit"
    end
  end

  def destroy
    find_book
    @book.destroy

    redirect_to books_path
  end

  def find_book
    @book = Book.find(params[:id])
  end

  def show
    find_book
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :year, :description)
  end

end
