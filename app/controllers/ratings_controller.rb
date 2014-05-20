class RatingsController < ApplicationController

  def rate
    @entree = Entree.find(params[:entree_id])    
    @rating = @entree.ratings.create(:value => params[:value], entree: @entree)
    flash[:success] = "Your rating was submitted!"
    redirect_to :back
  end

end