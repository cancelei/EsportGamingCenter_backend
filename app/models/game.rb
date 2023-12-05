# app/models/game.rb

class Game < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
end
