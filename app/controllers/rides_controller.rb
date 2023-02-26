class RidesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show

  end

  def new

  end

  def create
    
  end
end
