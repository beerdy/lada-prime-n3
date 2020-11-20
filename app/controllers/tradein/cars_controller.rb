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
