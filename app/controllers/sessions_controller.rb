class SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = warden.authenticate!(auth_options)
    if user 
      token = Tiddle.create_and_return_token(user, request, expires_in: 1.day)
      # Incluir el userId en la respuesta
      render json: { token: token, user_email: user.email, user_id: user.id, is_admin: user.is_admin }, status: 200
    else
      render json: { error: "Unauthorized" }, status: 401
    end
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
    # Implementación específica si es necesaria
  end
end
