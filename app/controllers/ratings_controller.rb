class RatingsController < ApplicationController

  before_filter :js_logged_in

  def create
    @rating = Rating.new(params[:rating])
    @book = Book.find(params[:rating][:book_id])

    respond_to do |format|
      if @rating.save
        format.json { render :json => { :avg_rating => @book.avg_rating } }
      else
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @book = Book.find(params[:rating][:book_id])
    @rating.update_attributes(params[:rating])

    respond_to do |format|
      if @rating.save
        format.json { render :json => { :avg_rating => @book.avg_rating } }
      else
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  def js_logged_in
    if(!user_signed_in?)
      flash[:error] = "You must be a signed in to leave a rating!"
      render :js => "window.location = '/users/sign_in'"
    end
  end

end