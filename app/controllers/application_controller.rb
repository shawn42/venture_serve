class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # protect_from_forgery :except => :create 
  skip_before_filter :verify_signed_out_user
end
