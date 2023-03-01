class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations et validations à mettre
  has_many :bookings, dependent: :destroy
  has_many :rides
  has_one_attached :photo
end
