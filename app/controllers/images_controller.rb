class ImagesController < ApplicationController
  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params.require(:image).permit(:url))
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @url = Image.find(params[:id]).url
  end

  def index
    @urls = Image.order('created_at DESC').map(&:url)
  end
end
