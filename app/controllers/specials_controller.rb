class SpecialsController < ApplicationController
  before_action :set_special, only: [:show, :edit, :update, :destroy]
  before_action :set_message, only: [:show, :index ]

  # GET /specials
  # GET /specials.json
  def index
    @specials = Special.all
  end

  # GET /specials/1
  # GET /specials/1.json
  def show
  end

  # GET /specials/new
  def new
    @special = Special.new
  end

  # GET /specials/1/edit
  def edit
  end

  # POST /specials
  # POST /specials.json
  def create
    @special = Special.new(special_params)

    respond_to do |format|
      if @special.save
        format.html { redirect_to @special, notice: 'Special was successfully created.' }
        format.json { render :show, status: :created, location: @special }
      else
        format.html { render :new }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specials/1
  # PATCH/PUT /specials/1.json
  def update
    respond_to do |format|
      if @special.update(special_params)
        format.html { redirect_to @special, notice: 'Special was successfully updated.' }
        format.json { render :show, status: :ok, location: @special }
      else
        format.html { render :edit }
        format.json { render json: @special.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specials/1
  # DELETE /specials/1.json
  def destroy
    @special.destroy
    respond_to do |format|
      format.html { redirect_to specials_url, notice: 'Special was successfully destroyed.' }
      format.json { head :no_content }
    end
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
