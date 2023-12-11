class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { status: {code: 200, message: 'Registrado exitosamente.'}, data: resource }
    else
      render json: { status: {message: "El usuario no pudo ser creado."} }, status: :unprocessable_entity
    end
  end
end
