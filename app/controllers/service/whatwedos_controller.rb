class Service::WhatwedosController < ApplicationController
  before_action :set_service_whatwedo, only: [:show]

  # GET /service/whatwedos
  # GET /service/whatwedos.json
  def index
    @service_whatwedos = Service::Whatwedo.all
  end

  # GET /service/whatwedos/1
  # GET /service/whatwedos/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_whatwedo
      @service_whatwedo = Service::Whatwedo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_whatwedo_params
      params.require(:service_whatwedo).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
