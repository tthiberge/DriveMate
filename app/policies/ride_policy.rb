class RidePolicy < ApplicationPolicy

  def show?
    true
  end

  # Pas obligatoire car on fait create
  # def new?
  #   true
  # end

  def create?
    true
  end

  def edit?
    (record.user == user)
  end

  def update?
    (record.user == user)
  end

  def destroy?
    # Renverra true ou false selon si le propriétaire de l'instance ride est bien le current_user (appelé user par pundit)
    (record.user == user)
  end


  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.where(user: user) # Si on veut ne voir que ses propres trajets sur la homepage
      scope.all
    end
  end
end
