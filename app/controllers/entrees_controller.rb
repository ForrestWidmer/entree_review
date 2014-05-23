class EntreesController < ApplicationController
respond_to :html, :json

before_filter :get_entree, only: [:show, :edit, :update]

  def index
    @entrees = Entree.searching(params[:search])
    respond_with @entrees
  end

  def show
    @reviews = @entree.reviews
    @imageable = @entree
    @images = @imageable.images
    @image = Image.new
    @location = request.location

    respond_with @entree
  end

  def new
    @entree = Entree.new
    @image = Image.new
  end

  def create
    @entree = Entree.new(params[:entree])
    if @entree.save
      flash[:success] = "New Entree created! Now please submit your review!"
      respond_with @entree
    else
      flash[:error] = "New Entree was not created, please ensure that you are not 
                       trying to create an item that already exists."
      render :new
    end
  end

  def edit
  end

  def update
    if @entree.update_attributes(params[:entree])
      flash[:success] = "Entree was updated!"
      respond_with @entree
    else
      flash[:error] = "Entree was not saved, please try again."
      render :edit
    end
  end

  def get_entree
    @entree = Entree.find(params[:id])
  end
end
