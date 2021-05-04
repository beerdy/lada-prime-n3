module ParserOfficialSite
  class Model
    attr_reader :models

    def initialize domain
      @domain = domain
      @models = []

      parse_content get_content
    end
    
    def parse_content data
      # Get model`s
      fiber_model = Fiber.new do
        data.css('.cars-menu__sem-name').each do |model|
          href_exist = true
          begin
            model = model.parent.attributes["href"].value
          rescue Exception => e
            # Временно описание модели отсутствует..
            href_exist = false
          end
          href_exist ? Fiber.yield( model.text, model.parent.attributes["href"].value) : Fiber.yield( model.text, '#') 
        end
      end

      # Get image`s
      fiber_image = Fiber.new do
        data.css('.cars-menu__sem-img').each do |image|
          Fiber.yield image.attributes["src"].value
        end
      end

      # Get complectation`s for model`s
      data.css('.cars-menu__sem').each do |block|
        model = nil
        image = nil

        # Remove &nbsp and other null first and last symbols
        model_, link = fiber_model.resume
        
        image = fiber_image.resume
        model = model_.scan(/(\w+\s*\w+)/)[0][0]


        # Next element if image OR model not exist 
        next if image.nil? or model.nil?

        # [ {name: '', url:''}, .. ]
        modifications = []
        block.css('.cars-menu__base-name').each do |complectation|
          about_url = complectation.attributes["href"].value
          price_url = get_price_url( about_url )
          modifications.push({"name" => complectation.text, "about_url" => complectation.attributes["href"].value, "price_url" => price_url  })
        end

        @models.push({ "model" => model, "link" => link ,"image" => image, "modifications" => modifications })
      end

      @models
    end

    private

      # If not exist then parse ELSE get content from BD
      def get_content
        time    = Time.now.strftime "%d/%m/%Y"
        
        content = nil

        if content
          # puts "CONTENT FROM BD"
        else
          # puts "!!!CONTENT FROM SITE!!!"

          # Open domain parsed site and read HTML
          content = open( @domain ) do |http|
            @html = http.read
          end

        end
        
        # Parse content
        Nokogiri::HTML( content )
      end

      # Get prices links for modifications
      def get_price_url link
        content = open( "#{@domain}#{link}" ) do |http|
          @html = http.read
        end
        sleep 0.3
        # Parse content for links price model (casecar) - modifications
        Nokogiri::HTML( content ).css('.quick_nav_text').each do |link|
          href = link.attributes["href"].value
          return href if href.scan('prices.html')[0]
        end
        # Old style - parce price from TOP slider
        Nokogiri::HTML( content ).css('.kompL_footer_button1').each do |link|
          href = link.attributes["href"].value
          return href if href.scan('prices.html')[0]
        end
        return '#'
      end
  end
end