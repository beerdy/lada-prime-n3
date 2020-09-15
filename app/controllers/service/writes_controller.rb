class Service::WritesController < ApplicationController
  before_action :set_service_write, only: [:show]

  # GET /service/writes/1
  # GET /service/writes/1.json
  def show
  end

  # POST /service/writes
  # POST /service/writes.json
  def create
    @service_write = Service::Write.new(service_write_params)

    respond_to do |format|
      if @service_write.save
        UserMailer.write_email(@service_write).deliver!
        format.html { redirect_to @service_write, notice: 'Write was successfully created.' }
        format.json { render :show, status: :created, location: @service_write }
      else
        format.html { render :new }
        format.json { render json: @service_write.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_write
      @service_write = Service::Write.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_write_params
      params.require(:service_write).permit(:name, :phone, :model, :year, :work, :mileage, :link, :url, :sort, :show)
    end
end
