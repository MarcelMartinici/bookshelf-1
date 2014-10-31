class GenresController < ApplicationController

  before_action :find_author, only: [:show]

  def index
    @genres = Genre.all
  end

  def show

  end

  def find_author

    @genre = Genre.find(params[:id])

  end

end
