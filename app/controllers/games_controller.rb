# app/controllers/games_controller.rb

class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_game, only: [:show]

  def index
    @games = Game.all
    render json: @games
  end

  def show
    render json: @game
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
