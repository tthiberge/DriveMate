class BookingPolicy < ApplicationPolicy

  def show?
    # Je ne comprends pas très bien pourquoi ça marche quand même sans mettre true
    false
  end

  def create?
    true
  end

  def update?
    (record.user == user)
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
