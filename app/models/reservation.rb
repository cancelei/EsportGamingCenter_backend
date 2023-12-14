# app/models/reservation.rb:

class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :reservation_date, presence: true
  validates :setup_config, presence: true
  validates :status, presence: true
end
