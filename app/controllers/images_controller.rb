class ImagesController < ApplicationController
  before_filter :load_imageable

  def index
    @images = @imageable.images
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = @imageable.images.new
  end

  def create
    @image = @imageable.images.build(params[:image])
    if @image.save
      flash[:success] = "New image(s) added."
      redirect_to :back
    else
      render :new
    end
  end

  def destroy
    @image = @imageable.images.find(params[:id])
    @image.destroy
    flash[:success] = "Image deleted."
    redirect_to @imageable
  end

private
  # alternative option:
  # def load_imageable
  #   resource, id = request.path.split('/')[1, 2]
  #   @imageable = resource.singularize.classify.constantize.find(id)
  # end

  
  def load_imageable
    klass = [Entree, Review].detect { |c| params["#{c.name.underscore}_id"] }
    @imageable = klass.find(params["#{klass.name.underscore}_id"])
  end

end
