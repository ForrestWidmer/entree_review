class WelcomeController < ApplicationController
  def index
  end

  def about
    @entree = Entree.first
    @image = @entree.images.last
  end
end
