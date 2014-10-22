class BooksController < ApplicationController

  def new

  end

  def create
    @book = Book.new(book_params)

    @book.save
    redirect_to @book

  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :author, :description)
  end

end
