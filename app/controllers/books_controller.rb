class BooksController < ApplicationController

  load_and_authorize_resource :only => [:edit, :update, :destroy, :show, :create]

  before_action :find_book, only: [:edit, :update, :destroy, :show]

  def new

    @book = Book.new

    authorize! :new, @book

  end


  def index

    @books = Book.all

  end

  def find_book

    @book = Book.find(params[:id])

  end

  def create

    @book = current_user.books.new(book_params)

    author_check

    if @book.save
      redirect_to @book
    else
      render "new"
    end

  end


  def update

    if @book.update(book_params)

      @book.author.name = author_check

      redirect_to @book

    else
      render "edit"
    end

  end

  def destroy

    @book.destroy

    redirect_to books_path

  end

  private

  def author_check

    @book.author = Author.create_from_name(params[:book][:author_name])

  end

  def book_params

    params.require(:book).permit(:title, :year, :description, :genre, :cover)

  end

end
