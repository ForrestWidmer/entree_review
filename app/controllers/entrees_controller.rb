class EntreesController < ApplicationController
  def index
    @entrees = Entree.all#search(params[:search])
  end

  def show
    @entree = Entree.find(params[:id])
    @reviews = @entree.reviews
    @imageable = @entree
    @images = @imageable.images
    @image = Image.new
  end

  def new
    @entree = Entree.new
    @image = Image.new
  end

  def create
    @entree = Entree.new(params[:entree])
    if @entree.save
      flash[:success] = "New Entree created!"
      redirect_to @entree
    else
      flash[:error] = "New Entree was not created, please try again."
      render :new
    end
  end

  def edit
    @entree = Entree.find(params[:id])
  end

  def update
    @entree = Entree.find(params[:id])
    if @entree.update_attributes(params[:entree])
      flash[:success] = "Entree was updated!"
      redirect_to @entree
    else
      flash[:error] = "Entree was not saved, please try again."
      render :edit
    end
  end
end
