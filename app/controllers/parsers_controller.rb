class ParsersController < ApplicationController
  before_action :init
  before_action :authenticate_user!
  
  def init
    @domain = "https://prime.lada.ru/"
  end

  def index
  end

  # POST
  def model
    parser = ParserOfficialSite::Model.new @domain
    models = parser.models

    models.each do |model|
      save_model model unless Model.find_by( model: model["model"] )
    end

    render json: { info: 'parsing in process..' }, status: 200
  end
  
  # POST
  def complectation
    ## For future...
    # @complectations_added = []
    # @complectations_exist = Complectation.pluck(:complectation_id)

    # Thread.new do
      Model.all.each do |model|
        modifications = JSON.parse( model.links )
        modifications.each do |modification|
          complectation_shared = ComplectationShared.new( @domain+modification['price_url'] )

          complectation_shared.modification_create({
            name:        modification['name'],
            description: complectation_shared.description,
            model_id:    model.id, 
            anchor_name: anchor_name( modification['price_url'] ),
            base_id:     complectation_shared.modification_id_on_site
          })
          
          complectation_shared.complectation_create({
            model_id:           model.id,
            modification_id:    complectation_shared.modification.id 
          }) unless modification['price_url'] == '#'

        end if modifications
      end
    # end

    render json: { info: 'parsing in process..' }, status: 200
  end
  
  # POST # /images_new/models/configurator/10518676_672.png
  def modification_image
    Model.all.each do |model|
      links = JSON.parse( model.links )
      links.each do |link|
        parser = ParserOfficialSite::ModificationColor.new @domain+link['price_url']
        
        # Find modification
        modification = Modification.find_by( base_id: parser.modification_base_id )
        
        parser.colors.each do |data|
          color = color_create( data )
          save_image( modification.id, color.id, parser.modification_base_id, data[:code] )
          save_meta({ modification_id: modification.id, color_id: color.id })
          ws_send_modification_image({
            modification_name: modification.name,
            color_name: data[:title],
            rgb: data[:rgb]
          })
        end if modification
      end
    end

    render json: { info: 'parsing in process..' }, status: 200
  end
  
  # POST
  def instock_price
    Model.all.each do |model|
      links = JSON.parse( model.links )
      links.each do |link|
        parser = ParserOfficialSite::Complectation.new

        sleep 1
        parser.load( @domain+link['price_url'] ) # "https://prime.lada.ru/#{params[:original]}"
        parser.parse

        # Find modification
        modification = Modification.find_by( base_id: parser.id )
        next unless
        
        parser.table.each do |item|
          # Find current eached complectation
          complectation = Complectation.find_by( complectation_id: item[:kompl_id] )
          # Colors instock create or update
          colors_modify( item[:color_codes], modification.id, complectation.id ) if complectation
        end
        # break
      end
      # break
    end

    render json: { info: @parser }, status: 200
    # render json: { info: 'parsing in process..' }, status: 200
  end
  
  # POST
  def tth
    Modification.all.each do |modification|
      links = JSON.parse( modification.model.links )
      links.each do |link|
        skip = false
        begin
          tth_link = @domain+link["price_url"].sub!('prices.html', 'tth.html')
        rescue Exception => e
          skip = true
        end
        next if skip

        parser = ParserOfficialSite::Tth.new( tth_link )
        parser.parse
        parser.engines.each do |engine|
          # "1.6 л 8-кл. (87 л.с.), 5МТ"
          engine_current = engine_create( modification.id, modification.base_id, engine.name )
          engine.carparts.each do |carpart|
            # "Кузов"
            specifications = []
            carpart.specifications.each do |specification|
              # "Код двигателя": "11186"
              specifications.push({ "#{specification.name}" => specification.description })
            end
            specification_create( engine_current.id, carpart.name, specifications.to_json, modification.id, modification.base_id )
          end
        end
        # break
      end
      # break
    end

    render json: { info: 'parsing in process..' }, status: 200
  end

  private
    def engine_create modification_id, base_id, name
      Engine.where( base_id: base_id, name: name ).destroy_all
      Engine.create( modification_id: modification_id, base_id: base_id, name: name )
    end
    def specification_create( engine_id, name, specifications, modification_id, base_id )
      Specification.where( engine_id: engine_id, name: name ).destroy_all
      Specification.create( engine_id: engine_id, name: name, description: specifications, modification_id: modification_id, base_id: base_id )      
    end
    def save_model model
      temp = Model.new( model: model["model"], link: model["link"], links: model["modifications"].to_json )
      return unless temp.picture_from_link( @domain+model["image"] )
      temp.save
    end
    # For modification_image
    def save_image modification_id, color_id, base_id, color_code
      modification_image = ModificationImage.new( modification_id: modification_id, color_id: color_id, base_id: base_id )
      image_link = @domain+'images_new/models/configurator/'+base_id+'_'+color_code+'.png'
      return unless modification_image.picture_from_link( image_link )
      modification_image.save
    end
    # For modification_image
    def color_create data
      color = Color.where( data ).first
      color = Color.create( data ) unless color
      color
    end
    # Colors instock create or update
    def colors_modify color_codes, modification_id, complectation_id
      # Remove all colors of complectation before add
      ComplectationColor.where( modification_id: modification_id, complectation_id: complectation_id ).destroy_all
      color_codes.each do |code|
        color = Color.find_by( code: code )
        ComplectationColor.create( code: code, color_id: ( color.nil? ? 0 : color.id ), modification_id: modification_id, complectation_id: complectation_id )
      end
    end
    # For modification_image
    def save_meta data
      modification_color = ModificationColor.where( data ).first
      ModificationColor.create( data ) unless modification_color
    end
    def anchor_name url, anchor = ''
      return url.split('/')[4]
    rescue Exception => e
      return anchor
    end 
    def ws_send_modification_image options
      message = {"action":"color_uploading","color":options[:color_name],"modification":options[:modification_name],"rgb":options[:rgb]}
      ActionCable.server.broadcast 'parser_notify_channel', message
    end
    def ws_send
      ActionCable.server.broadcast 'parser_notify_channel', '{"model":"'+model.model+'","modification":"'+complectation['price_url']+'"}'
    end
end