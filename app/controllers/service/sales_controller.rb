class Service::SalesController < Service::ServiceController
  before_action :set_service_sale, only: [:show]

  # GET /service/sales
  # GET /service/sales.json
  def index
    @service_sales = Service::Sale.all
  end

  # GET /service/sales/1
  # GET /service/sales/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_sale
      @service_sale = Service::Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_sale_params
      params.require(:service_sale).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
