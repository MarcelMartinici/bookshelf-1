class UsersController < ApplicationController
 # load_and_authorize_resource

  before_action :find_user, only: [:show]

  def index

    @users = User.all

  end

  def find_user

    @user = User.find(params[:id])

  end

end
