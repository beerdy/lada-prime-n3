class Tradein::CarImagesController < ApplicationController
  before_action :set_tradein_car_image, only: [:show, :edit, :update, :destroy]

  # GET /tradein/car_images
  # GET /tradein/car_images.json
  def index
    @tradein_car_images = Tradein::CarImage.all
  end

  # GET /tradein/car_images/1
  # GET /tradein/car_images/1.json
  def show
  end

  # GET /tradein/car_images/new
  def new
    @tradein_car_image = Tradein::CarImage.new
  end

  # GET /tradein/car_images/1/edit
  def edit
  end

  # POST /tradein/car_images
  # POST /tradein/car_images.json
  def create
    @tradein_car_image = Tradein::CarImage.new(tradein_car_image_params)

    respond_to do |format|
      if @tradein_car_image.save
        format.html { redirect_to @tradein_car_image, notice: 'Car image was successfully created.' }
        format.json { render :show, status: :created, location: @tradein_car_image }
      else
        format.html { render :new }
        format.json { render json: @tradein_car_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tradein/car_images/1
  # PATCH/PUT /tradein/car_images/1.json
  def update
    respond_to do |format|
      if @tradein_car_image.update(tradein_car_image_params)
        format.html { redirect_to @tradein_car_image, notice: 'Car image was successfully updated.' }
        format.json { render :show, status: :ok, location: @tradein_car_image }
      else
        format.html { render :edit }
        format.json { render json: @tradein_car_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tradein/car_images/1
  # DELETE /tradein/car_images/1.json
  def destroy
    @tradein_car_image.destroy
    respond_to do |format|
      format.html { redirect_to tradein_car_images_url, notice: 'Car image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tradein_car_image
      @tradein_car_image = Tradein::CarImage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tradein_car_image_params
      params.require(:tradein_car_image).permit(:tradein_car_id)
    end
end
