class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user! # Uncomment if nee auth before every action


  check_authorization :unless => :do_not_check_authorization?

  def do_not_check_authorization?
    respond_to?(:devise_controller?)
  end

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

end

