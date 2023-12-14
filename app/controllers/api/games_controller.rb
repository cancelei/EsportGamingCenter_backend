module Api
  class GamesController < ApplicationController
    before_action :set_game, only: %i[show destroy]

    def index
      @games = Game.all
      render json: @games
    end

    def show
      render json: @game
    end

    def create
      @game = Game.new(game_params)

      if current_user.is_admin && @game.save
        render json: @game, status: :created
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    def destroy
      if current_user.is_admin && @game.destroy
        head :no_content
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    private

    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:title, :description, :image_url)
    end
  end
end
