class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:destroy]

  def index
    @games = current_user.games
  end

  def new
    @game = current_user.games.build
  end

  def create
    @game = current_user.games.build(game_params)

    if @game.save
      redirect_to games_path, notice: 'Game was successfully added.'
    else
      render :new
    end
  end

  def destroy
    if current_user == @game.user
      @game.destroy
      redirect_to games_path, notice: 'Game was successfully deleted.'
    else
      redirect_to games_path, alert: 'You are not authorized to delete this game.'
    end
  end

  private

  def set_game
    @game = current_user.games.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:title, :description)
  end
end
