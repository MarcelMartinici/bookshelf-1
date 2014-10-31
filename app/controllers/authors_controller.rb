class AuthorsController < ApplicationController

  before_action :find_author, only: [:show]

  def index

    @authors = Author.all

  end

  def find_author

    @author = Author.find(params[:id])

  end


end
