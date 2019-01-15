class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params.require(:image).permit(:url, :tag_list))
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def index
    @images = Image.order('created_at DESC')
    @images = @images.tagged_with(params['tag']) if params.key?('tag')
    flash.now[:alert] = "No images tagged with #{params['tag']}" if params.key?('tag') && @images.empty?
  end
end
