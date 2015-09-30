class SessionsController < Devise::SessionsController
  def create
    respond_to do |format|
      format.html { super }
      format.json do
        # self.resource = warden.authenticate!(auth_options)
        # http://stackoverflow.com/q/10717667
        user = current_user

        authenticate_with_http_token do |token, options|
          user_email = options[:email].presence
          user       = user_email && User.find_for_authentication(email: user_email)

          if user && Devise.secure_compare(user.authentication_token, token)
            sign_in user, store: false
          end

        end

        data = {
          token: user.authentication_token,
          email: user.email
        }
        render json: data, status: 201
      end
    end
  end
end
