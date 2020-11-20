class ModificationsController < ApplicationController
  include FilterCars
  
  before_action :set_modification, only: [:show, :edit, :update, :destroy]
  before_action :filter_price

  # GET /modifications
  # GET /modifications.json
  def index
    # @modifications = Modification.all
  end

  # GET /modifications/1
  # GET /modifications/1.json
  def show
    @models = Model.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modification
      @model = Model.find_by( url: params[:model_id] )
      @modification = @model.modifications.find_by( anchor_name: params[:id] )
    end

    # Only allow a list of trusted parameters through.
    def modification_params
      params.require(:modification).permit(:name, :second_name, :anchor_name, :link_about, :link_complectations, :description, :show, :sort)
    end
end
