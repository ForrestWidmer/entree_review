class ReviewsController < ApplicationController
  respond_to :html, :json
  before_filter :get_entree

  def index
    @reviews = @entree.reviews
    respond_with @reviews
  end

  def show
    @review = Review.find(params[:id])
    @imageable = @review
    @images = @imageable.images
    @image = Image.new

    respond_with @review
  end

  def new
    @review = Review.new
  end

  def create
    @review = @entree.reviews.build(params[:review])
    if @review.save
      flash[:success] = "Your review was successfully added! Thanks!"
      respond_with(@entree, @review)
    else
      flash[:error] = "Your review was not saved, please try again."
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
  @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      flash[:success] = "Review Updated!"
      respond_with(@entree, @review)
    else
      flash[:error] = "Review NOT saved, please try again."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Entree deleted"
    respond_with @review
  end

  def get_entree
    @entree = Entree.find(params[:entree_id])
  end
end
