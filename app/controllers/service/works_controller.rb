class Service::WorksController < Service::ServiceController
  before_action :set_service_work, only: [:show,:index]

  # GET /service/works
  # GET /service/works.json
  def index
  end

  # GET /service/works/1
  # GET /service/works/1.json
  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_work
      @service_work = Service::Work.find_by( link: params[:id] )
      @service_jobs = Service::Job.all
      @service_job = Service::Job.find_by( link: params[:job_id] )
      @service_works = @service_job.works
    end

    # Only allow a list of trusted parameters through.
    def service_work_params
      params.require(:service_work).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
