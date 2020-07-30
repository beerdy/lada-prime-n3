class ComplectationShared
    attr_reader :modification, :modification_id_on_site, :description

    def initialize domain
      @parser = ParserOfficialSite::Complectation.new
      @parser.load( domain ) # "https://prime.lada.ru/#{params[:original]}"
      @parser.parse
      @description = @parser.devise
      @modification_id_on_site = @parser.id
    end

    def modification_create options
      @modification = nil
      @modification = Modification.where( options ).last
      @modification = Modification.create( options ) unless @modification
    end

    def complectation_create options
      @parser.table.each do |item|
        complectation = complectation_modify( item, item[:kompl_id], options[:model_id], options[:modification_id] )
        options_create( complectation.id, item[:property] )
      end
    end

  private
    def complectation_modify item, complectation_id, model_id, modification_id
      complectation = Complectation.find_by(complectation_id: complectation_id)
      request_ = complectation_params_prepare( item, complectation_id )
      if complectation #
        complectation.update( request_ )
      else
        complectation = Complectation.create( request_.merge( model_id: model_id, modification_id: modification_id ) )
      end
      complectation
    end
    
    def options_create complectation_id, property
      # Интерьер, Экстерьер, Безопастность, Комфорт, Экстерьер
      property.each do |item|
        # Опции для каждого из property элемента (избыточная таблица по options)
        item[:options].each do |option|
          temp_option = Option.where(  property: item[:name], name: option ).last
          temp_option = Option.create( property: item[:name], name: option ) unless temp_option # complectation_id: complectation_id,
          
          temp_complectation_option = ComplectationOption.where( complectation_id: complectation_id, option_id: temp_option.id ).last
          complectation_option = ComplectationOption.create( complectation_id: complectation_id, option_id: temp_option.id ) unless temp_complectation_option
        end
      end
    end

  protected
    def complectation_params_prepare item, complectation_id
      begin
        engine     = item[:kompl_name].scan( /(\d.\d)/)[0][0]
      rescue Exception => e
        engine     = 'no_engine'
      end
      begin
        clapan     = item[:kompl_name].scan( /(\d{1,2})-кл/)[0][0]
      rescue Exception => e
        clapan     = 0
      end
      begin
        power      = item[:kompl_name].scan(/(\d{2,})\s*[лЛ]/)[0][0]
      rescue Exception => e
        power      = 0
      end
      begin
        price_new  = item[:price_new].scan(/(\d+\s*\d+)/)[0][0].remove(' ').to_i  
      rescue Exception => e
        price_new  = 0
      end
      begin
        price_old  = item[:price_old].scan(/(\d+\s*\d+)/)[0][0].remove(' ').to_i
      rescue Exception => e
        price_old  = 0
      end
      begin
        transmission = case item[:kompl_name].scan(/([МТА]{2,3})/)[0][0]
          when "АМТ"
            "Робот"
          when "АТ"
            "Автомат"
          when "МТ"
            "Механика"
        end        
      rescue Exception => e
        transmission = 'no_transmission'
      end
      begin
        casecar      = @parser.name        
      rescue Exception => e
        casecar      = 'no_casecar'
      end
      begin
        casecar_url  = @complectation_link.split('/')[6]
      rescue Exception => e
        casecar_url  = 'no_casecar_url' 
      end
      begin
        kompl_name   = item[:kompl_name]
      rescue Exception => e
        kompl_name   = 'no_kompl_name'
      end
      
      colors       = "Связанная таблица ???"
      order        = "На заказ"
      condition    = "Новый"
      # For usedcars
      owners       = 0
      millage      = 0
      drive        = "Передний"
      year         = 0
  

      {
        complectation_id: complectation_id, 
        title:            kompl_name, 
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

    ## Все параметры
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
end