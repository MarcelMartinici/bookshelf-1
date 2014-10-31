class GenresController < ApplicationController

  before_action :find_genre, only: [:show]

  def index

    @genres = Genre.all

  end

  def find_genre

    @genre = Genre.find(params[:id])

  end

end
