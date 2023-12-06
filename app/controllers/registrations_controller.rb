# app/controllers/registrations_controller.rb

class RegistrationsController < Devise::RegistrationsController
    respond_to :json
  end
  