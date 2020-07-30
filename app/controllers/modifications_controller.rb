class ModificationsController < ApplicationController
  include FilterPrice
  
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

  # GET /modifications/new
  def new
    @modification = Modification.new
  end

  # GET /modifications/1/edit
  def edit
  end

  # POST /modifications
  # POST /modifications.json
  def create
    @modification = Modification.new(modification_params)

    respond_to do |format|
      if @modification.save
        format.html { redirect_to @modification, notice: 'Modification was successfully created.' }
        format.json { render :show, status: :created, location: @modification }
      else
        format.html { render :new }
        format.json { render json: @modification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modifications/1
  # PATCH/PUT /modifications/1.json
  def update
    respond_to do |format|
      if @modification.update(modification_params)
        format.html { redirect_to @modification, notice: 'Modification was successfully updated.' }
        format.json { render :show, status: :ok, location: @modification }
      else
        format.html { render :edit }
        format.json { render json: @modification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modifications/1
  # DELETE /modifications/1.json
  def destroy
    @modification.destroy
    respond_to do |format|
      format.html { redirect_to modifications_url, notice: 'Modification was successfully destroyed.' }
      format.json { head :no_content }
    end
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
