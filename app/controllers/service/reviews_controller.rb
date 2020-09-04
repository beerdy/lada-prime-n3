class Service::ReviewsController < ApplicationController
  before_action :set_service_review, only: [:show, :edit, :update, :destroy]

  # GET /service/reviews
  # GET /service/reviews.json
  def index
    @service_reviews = Service::Review.all
  end

  # GET /service/reviews/1
  # GET /service/reviews/1.json
  def show
  end

  # GET /service/reviews/new
  def new
    @service_review = Service::Review.new
  end

  # POST /service/reviews
  # POST /service/reviews.json
  def create
    @service_review = Service::Review.new(service_review_params)

    respond_to do |format|
      if @service_review.save
        format.html { redirect_to @service_review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @service_review }
      else
        format.html { render :new }
        format.json { render json: @service_review.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_review
      @service_review = Service::Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_review_params
      params.require(:service_review).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
