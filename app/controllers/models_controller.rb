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

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit
  end

  # POST /models
  # POST /models.json
  def create
    respond_to do |format|
      unless errors.nil?
        format.html { redirect_to models_path, notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: { errors: [errors]}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
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