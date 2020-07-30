class ComplectationsController < ApplicationController
  before_action :set_complectation, only: [:show, :edit, :update, :destroy]

  # GET /complectations
  # GET /complectations.json
  def index
    # @complectations = Complectation.all
  end

  # GET /complectations/1
  # GET /complectations/1.json
  def show
  end

  # GET /complectations/new
  def new
    @complectation = Complectation.new
  end

  # GET /complectations/1/edit
  def edit
  end

  # POST /complectations
  # POST /complectations.json
  def create
  end

  # PATCH/PUT /complectations/1
  # PATCH/PUT /complectations/1.json
  def update
    respond_to do |format|
      if @complectation.update(complectation_params)
        format.html { redirect_to @complectation, notice: 'Complectation was successfully updated.' }
        format.json { render :show, status: :ok, location: @complectation }
      else
        format.html { render :edit }
        format.json { render json: @complectation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complectations/1
  # DELETE /complectations/1.json
  def destroy
    # @complectation.destroy
    # respond_to do |format|
    #   format.html { redirect_to complectations_url, notice: 'Complectation was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
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
