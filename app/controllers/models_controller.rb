class ModelsController < ApplicationController
  include FilterCars

  before_action :set_model_s, only: [:show, :index]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new ]
  before_action :filter_price, only: [:show, :index]
  before_action :set_filter, only: [:show, :index]
  
  # GET /models
  # GET /models.json
  def index
    @models.each do |model|
      model.modifications.each do |modification|
        # Modification belong to model
        @filter.add modification.complectations_minimum_price, modification
      end
    end

    @filter.sort_price @pricesort
    @elements = @filter.elements
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @model.modifications.each do |modification|
      # Modification belong to model
      @filter.add modification.complectations_minimum_price, modification
    end

    @filter.sort_price @pricesort
    @elements = @filter.elements
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_s
      @models = Model.all
      
      @model  = Model.find_by( url: params[:id] ) 
      @model  = Model.find_by( id: params[:id] ) unless @model
    end
    def set_filter
      @filter = Filter.new( @pricemin, @pricemax )
    end
    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:model).permit(:model, :description, :links, :slave, :link, :url, :sort, :show)
    end
end