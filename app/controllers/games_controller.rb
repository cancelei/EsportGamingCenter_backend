class GamesController < ApplicationController
  before_action :set_game, only: [:destroy]

  
  def index
    @games = Game.all
    render json: @games
  end

 
  def create
    @game = Game.new(game_params)

    if @game.save
      render json: @game, status: :created
    else
      render json: @game.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    if @game.destroy
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
