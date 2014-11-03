class RatingsController < ApplicationController

  before_action :js_logged_in

  def create
    @rating = Rating.new(rating_params)
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

    respond_to do |format|
      if @rating.update_attributes(rating_params)
        format.json { render :json => { :avg_rating => @rating.book.avg_rating } }
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

  private

  def rating_params

    params.require(:rating).permit(:book_id, :stars, :user_id)

  end

end
