class ComplectationsController < ApplicationController
  before_action :set_complectation, only: [:show]

  # GET /complectations
  # GET /complectations.json
  def index
    # @complectations = Complectation.all
  end

  # GET /complectations/1
  # GET /complectations/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_complectation
      @complectation = Complectation.find(params[:id])
    end

    def complectation_params
      params.require(:complectation).permit(:title, :description, :engine, :clapan, :power, :transmission, :order, :colors, :owners, :millage, :casecar, :drive, :year, :condition, :price_new, :price_old, :link, :url, :sort, :show, :complectation_id )
    end
end
