class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :comment, length: { minimum: 10 }

  # Jerome propose une méthode :enum. Pas mal, à voir si on l'intègre
end
