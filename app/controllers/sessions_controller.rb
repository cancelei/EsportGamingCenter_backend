class SessionsController < Devise::SessionsController
    respond_to :json

    def create
      user = warden.authenticate!(auth_options)
      token = Tiddle.create_and_return_token(user, request)
      render json: { authentication_token: token }
    end
  
    def destroy
      Tiddle.expire_token(current_user, request) if current_user
      render json: {}
    end
  
    private
  
    def respond_with(resource, _opts = {})
      render json: resource
    end
  
    def respond_to_on_destroy
      head :no_content
    end

    def verify_signed_out_user
    end
  end
  