class Tradein::CarsController < ApplicationController
  include SortNull
  before_action :set_tradein_car, only: [:show]

  # # GET /tradein/cars
  # # GET /tradein/cars.json
  # def index
  #   @tradein_cars = Tradein::Car.all
  # end

  # GET /tradein/cars/1
  # GET /tradein/cars/1.json
  def show
    @sliders  = sort_null(Slider.all).sort_by(&:sort).reverse
  end

  # # GET /tradein/cars/new
  # def new
  #   @tradein_car = Tradein::Car.new
  # end

  # # GET /tradein/cars/1/edit
  # def edit
  # end

  # # POST /tradein/cars
  # # POST /tradein/cars.json
  # def create
  #   @tradein_car = Tradein::Car.new(tradein_car_params)

  #   respond_to do |format|
  #     if @tradein_car.save
  #       format.html { redirect_to @tradein_car, notice: 'Car was successfully created.' }
  #       format.json { render :show, status: :created, location: @tradein_car }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @tradein_car.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /tradein/cars/1
  # # PATCH/PUT /tradein/cars/1.json
  # def update
  #   respond_to do |format|
  #     if @tradein_car.update(tradein_car_params)
  #       format.html { redirect_to @tradein_car, notice: 'Car was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @tradein_car }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @tradein_car.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /tradein/cars/1
  # # DELETE /tradein/cars/1.json
  # def destroy
  #   @tradein_car.destroy
  #   respond_to do |format|
  #     format.html { redirect_to tradein_cars_url, notice: 'Car was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tradein_car
      @tradein_car = Tradein::Car.find(params[:id])
    end

  #   # Only allow a list of trusted parameters through.
  #   def tradein_car_params
  #     params.fetch(:tradein_car, {})
  #   end
end
