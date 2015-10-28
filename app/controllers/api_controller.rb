class ApiController < ApplicationController
  before_filter :authenticate_user_from_token!

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from Exception, :with => :render_error

  private

    def authenticate_user_from_token!
      authenticate_with_http_token do |token, options|
        user_email = options[:email].presence
        user       = user_email && User.find_for_authentication(email: user_email)

        if user && Devise.secure_compare(user.authentication_token, token)
          sign_in user, store: false
        end
      end
    end

    def render_404
      respond_to do |format|
        format.html { render :action => "errors/404.html.erb", :status => 404 }
        format.json { render json: {}, status: 404 }
      end
    end

    def render_error(ex)
      respond_to do |format|
        format.html { raise }
        format.csv { raise }
        format.json do 
          puts ex.message
          puts ex.backtrace[0..20]
          data = {error: ex.message}
          render json: data, status: 500 
        end
      end
    end
end
