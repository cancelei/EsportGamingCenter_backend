class GamesController < ApplicationController
  before_action :set_game, only: [:destroy]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: 'Game was successfully added.'
    else
      render :new
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path, notice: 'Game was successfully deleted.'
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description)
  end
end
