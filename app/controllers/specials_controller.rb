class SpecialsController < ApplicationController
  before_action :set_special, only: [:show, :edit, :update, :destroy]
  before_action :set_message, only: [:show, :index ]

  # GET /specials
  # GET /specials.json
  def index
  end

  # GET /specials/1
  # GET /specials/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_special
      @special = Special.find(params[:id])
    end
    def set_message
      @message = Message.new()
    end

    # Only allow a list of trusted parameters through.
    def special_params
      params.require(:special).permit(:title, :description, :slave, :link, :url, :sort, :show)
    end
end
