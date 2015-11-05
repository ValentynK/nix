class ImagesController < ApplicationController
  respond_to :json, :xml, :html

  def index
    @record = Image.all
  end

  def new
  end

  def create
    @record = Image.new(image_params)

    if @record.save
      respond_with(@record)
    end
  end

  def show
    @record = Image.find(params[:id])
  end

  private
  def image_params
    params.require(:record).permit(:image)
  end
end
