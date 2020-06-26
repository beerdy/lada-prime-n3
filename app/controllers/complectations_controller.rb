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
    # "https://prime.lada.ru/ds/cars/4x4/urban/prices.html" # 

    @parser = ParserOfficialSite::Complectation.new
    # @parser.load "https://prime.lada.ru/#{params[:original]}"
    # @parser.name

    # # @parser.table.each do |item|
    # #   puts "="*100
    # #   pp item
    # # end
    # # pp @parser
    create
  end

  # GET /complectations/new
  def new
    # @complectation = Complectation.new
  end

  # GET /complectations/1/edit
  def edit
  end

  # POST /complectations
  # POST /complectations.json
  def create
    # @complectation = Complectation.new(complectation_params)

    # respond_to do |format|
    #   if @complectation.save
    #     format.html { redirect_to @complectation, notice: 'Complectation was successfully created.' }
    #     format.json { render :show, status: :created, location: @complectation }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @complectation.errors, status: :unprocessable_entity }
    #   end
    # end

    @parser = ParserOfficialSite::Complectation.new
    @parser.load "https://prime.lada.ru/#{params[:original]}" # "https://prime.lada.ru/#{params[:original]}"
    @parser.parse
    

    @parser.table.each do |item|
      complectation_id = item[:kompl_id]
      complectation_create item, complectation_id
    end
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
      # @complectation = Complectation.find(params[:id])
    end

    def get_params

    end

    def complectation_create item, complectation_id
      complectation_temp = Complectation.where(complectation_id: complectation_id)
      complectation_temp.destroy_all if complectation_temp
      complectation = Complectation.create( complectation_params_prepare(item, complectation_id) )
      options_create complectation.id, item[:property]
    end
    
    def options_create complectation_id, property
      # Интерьер, Экстерьер, Безопастность, Комфорт, Экстерьер
      property.each do |item|
        # Опции для каждого из property элемента (избыточная таблица по options)
        item[:options].each do |option|
          Option.create( complectation_id: complectation_id, property: item[:name], name: option )
        end
      end
    end

    def complectation_params_prepare item, complectation_id

      engine       = item[:kompl_name].scan( /(\d.\d)/)[0][0]
      clapan       = item[:kompl_name].scan( /(\d{1,2})-кл/)[0][0]
      power        = item[:kompl_name].scan(/(\d{2,})\s*[лЛ]/)[0][0]
      price_new    = item[:price_new].scan(/(\d+\s*\d+)/)[0][0].remove(' ').to_i
      price_old    = item[:price_old].scan(/(\d+\s*\d+)/)[0][0].remove(' ').to_i
      transmission = case item[:kompl_name].scan(/([МТА]{2,3})/)[0][0]
        when "АМТ"
          "Робот"
        when "АТ"
          "Автомат"
        when "МТ"
          "Механика"
      end
          # "https://prime.lada.ru/ds/cars/4x4/urban/prices.html" # 
      casecar      = @parser.name
      casecar_url  = params[:original].split('/')[3]
      colors       = "Связанная таблица ???"
      order        = "На заказ"
      condition    = "Новый"
      # For usedcars
      owners       = 0
      millage      = 0
      drive        = "Передний"
      year         = 0
      
      # puts "="*50
      # puts "id: #{item[:kompl_id].value}"
      # puts "title: #{item[:kompl_name]}"
      # puts "engine: #{engine}"
      # puts "clapan: #{clapan}"
      # puts "power: #{power}"
      # puts "price_new: #{price_new}"
      # puts "price_old: #{price_old}"
      # puts "transmission: #{transmission}"
      # puts "casecar: #{casecar}"
      # puts "colors: #{colors}"
      # puts "order: #{order}"
      # puts "condition: #{condition}"
      # puts "owners: #{owners}"
      # puts "millage: #{millage}"
      # puts "drive: #{drive}"
      # puts "year: #{year}"

      {
        complectation_id: complectation_id, 
        title:            item[:kompl_name], 
        engine:           engine,
        clapan:           clapan,
        power:            power,
        price_new:        price_new,
        price_old:        price_old,
        transmission:     transmission,
        casecar:          casecar,
        casecar_url:      casecar_url,
        colors:           colors,
        order:            order,
        condition:        condition,
        owners:           owners,
        millage:          millage,
        drive:            drive,
        year:             year
      }
    end

    def complectation_params
      params.require(:complectation).permit(:title, :description, :engine, :clapan, :power, :transmission, :order, :colors, :owners, :millage, :casecar, :drive, :year, :condition, :price_new, :price_old, :link, :url, :sort, :show, :complectation_id )
    end
end
