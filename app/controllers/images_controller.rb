class ImagesController < ActionController::Base
  protect_from_forgery with: :exception

  def new
    @image = Image.new
  end

  def create
    redirect_to Image.create(params.require(:image).permit(:url))
  end

  def show
    @url = Image.find(params[:id]).url
  end
end
