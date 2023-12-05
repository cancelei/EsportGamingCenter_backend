# app/models/user.rb

class User < ApplicationRecord
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy

  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
