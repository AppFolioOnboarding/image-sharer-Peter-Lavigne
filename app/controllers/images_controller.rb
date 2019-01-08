class ImagesController < ActionController::Base
  protect_from_forgery with: :exception

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(params.require(:image).permit(:url))
    if @image.save
      redirect_to @image
    else
      render 'new'
    end
  end

  def show
    @url = Image.find(params[:id]).url
  end
end
