class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { status: { code: 200, message: 'Registered successfully.' }, data: resource }
    else
      render json: { status: { message: 'The user could not be created.' } }, status: :unprocessable_entity
    end
  end
end
