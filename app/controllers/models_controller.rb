class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy ]

  # GET /models
  # GET /models.json
  def index
    @models = Model.all
  end

  # GET /models/1
  # GET /models/1.json
  def show
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
    @model = Model.new

    # Port prime.lada.ru
    parser = ParserOfficialSite::Model.new "https://prime.lada.ru/"
    models = parser.models
    errors = nil

    models.each do |model|
      save_model model unless Model.find_by( model: model["model"] )
    end

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
    def save_model model, domain='https://prime.lada.ru'
      temp = Model.new( model: model["model"], link: model["link"], complectations: model["complectations"].to_json )
      return unless temp.picture_from_link( domain+model["image"] )
      temp.save
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def model_params
      params.require(:model).permit(:model, :description, :complectations, :slave, :link, :url, :sort, :show)
    end
end
