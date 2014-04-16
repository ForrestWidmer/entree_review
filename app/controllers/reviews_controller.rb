class ReviewsController < ApplicationController

  def index
    @entree = Entree.find(params[:entree_id])
    @reviews = @entree.reviews
  end

  def show
    @entree = Entree.find(params[:entree_id])
    @review = Review.find(params[:id])
  end

  def new
    @entree = Entree.find(params[:entree_id])
    @review = Review.new
  end

  def create
    @entree = Entree.find(params[:entree_id])
    @review = @entree.reviews.build(params[:review])
    if @review.save
      flash[:success] = "Your review was successfully added! Thanks!"
      redirect_to [@entree, @review]
    else
      flash[:error] = "Your review was not saved, please try again."
      render :new
    end
  end

  def edit
    @entree = Entree.find(params[:entree_id])
    @review = Review.find(params[:id])
  end

  def update
    @entree = Entree.find(params[:entree_id])
    @review = Review.find(params[:id])
      if @review.update_attributes(params[:review])
        flash[:success] = "Review Updated!"
        redirect_to [@entree, @review]
      else
        flash[:error] = "Review NOT saved, please try again."
        render :edit
      end
  end
end
