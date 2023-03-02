class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ride

  validates :comment, length: { minimum: 10 }

  # Active Record nous permet de definir des scope, et il fera lui-même les requêtes SQL
  # ça me permettra de faire array_de_bookings.pending_bookings pour récupérer les pending bookings
  scope :pending_bookings, -> { where(status: "Pending") } # where.not si je veux l'inverse
  scope :confirmed_bookings, -> { where(status: "Confirmed") } # where.not si je veux l'inverse
  scope :declined_bookings, -> { where(status: "Declined") } # where.not si je veux l'inverse

  # Jerome propose une méthode :enum. Pas mal, à voir si on l'intègre
end
