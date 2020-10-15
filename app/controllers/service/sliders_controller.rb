class Service::SlidersController < ApplicationController
  before_action :set_service_slider, only: [:show]

  # GET /service/sliders
  # GET /service/sliders.json
  def index
  end

  # GET /service/sliders/1
  # GET /service/sliders/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_slider
      @service_slider = Service::Slider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_slider_params
      params.require(:service_slider).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
