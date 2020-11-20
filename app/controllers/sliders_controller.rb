class SlidersController < ApplicationController
  before_action :set_slider, only: [:show, :edit, :update, :destroy]

  # GET /sliders
  # GET /sliders.json
  def index
    @sliders = sort_null(Slider.all).sort_by(&:sort).reverse
  end

  # GET /sliders/1
  # GET /sliders/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slider
      @slider = Slider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def slider_params
      params.require(:slider).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
