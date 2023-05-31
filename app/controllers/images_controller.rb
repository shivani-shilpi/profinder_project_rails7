require "base64"
class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show edit update destroy ]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    base64_image = ImageToBase64.new(image_params.fetch("attachment"))
    @image.data_uri = base64_image.image_to_base64

    # path = image_params.fetch("attachment").tempfile.path
    # content_type = image_params.fetch("attachment").content_type
    # @image.data_uri = File.open(path, 'rb') do |img|
    #                   base64_image = Base64.strict_encode64(img.read)
    #                   "data:#{content_type};base64,#{base64_image}"
    # end

    respond_to do |format|
      if @image.save
        format.html { redirect_to image_url(@image), notice: "Image was successfully created." }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to image_url(@image), notice: "Image was successfully updated." }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image.destroy

    respond_to do |format|
      format.html { redirect_to images_url, notice: "Image was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:attachment)
    end
end
