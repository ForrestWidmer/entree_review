class ReviewsController < ApplicationController
  before_filter :get_entree

  def get_entree
    @entree = Entree.find(params[:entree_id])
  end

  def index
    @reviews = @entree.reviews
  end

  def show
    @review = Review.find(params[:id])
    @imageable = @review
    @images = @imageable.images
    @image = Image.new
  end

  def new
    @review = Review.new
  end

  def create
    @review = @entree.reviews.build(params[:review])
    if @review.save
      flash[:success] = "Your review was successfully added! Thanks!"
      redirect_to root_path
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
        redirect_to [@entree, @review]
      else
        flash[:error] = "Review NOT saved, please try again."
        render :edit
      end
  end
end
