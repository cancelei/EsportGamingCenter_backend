class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: true
  belongs_to :game, foreign_key: true
end
