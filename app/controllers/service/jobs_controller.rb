class Service::JobsController < Service::ServiceController
  before_action :set_service_job, only: [:show]
  before_action :set_service_jobs, only: [:show,:index]

  # GET /service/jobs
  # GET /service/jobs.json
  def index
  end

  # GET /service/jobs/1
  # GET /service/jobs/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_job
      @service_job = Service::Job.find_by(link: params[:id])
    end
    def set_service_jobs
      @service_jobs = Service::Job.all
    end
    # Only allow a list of trusted parameters through.
    def service_job_params
      params.require(:service_job).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
