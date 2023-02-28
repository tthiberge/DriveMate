class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Associations et validations à mettre
  has_many :bookings, dependent: :destroy
  has_many :rides

  # Création d'une association directe entre booking et user via ride
  # (permet de sélectionner plus facilement les bookings des propriétaires)

  has_many :owner_bookings, through: :rides, source: :bookings


end
