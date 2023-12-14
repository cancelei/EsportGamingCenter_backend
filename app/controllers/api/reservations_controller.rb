module Api
  class ReservationsController < ApplicationController
    before_action :set_reservation, only: %i[show update destroy]

    def index
      @reservations = Reservation.all.includes(:game)
      render json: @reservations.as_json(include: :game)
    end

    def show
      render json: @reservation
    end

    def create
      @reservation = Reservation.new(reservation_params)

      if User.exists?(@reservation.user_id)
        if @reservation.save
          render json: @reservation, status: :created
        else
          render json: @reservation.errors, status: :unprocessable_entity
        end
      else
        render json: { error: 'User not found' }, status: :not_found
      end
    end

    def update
      if @reservation.update(reservation_params)
        render json: @reservation
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if @reservation.destroy
      head :no_content
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    end

    private

    def reservation_params
      params.require(:reservation).permit(:reservation_date, :setup_config, :game_id, :user_id, :status, :platform)
    end

    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
  end
end
